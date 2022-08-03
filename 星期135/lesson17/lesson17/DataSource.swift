//
//  DataSource.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/7/29.
//

import Foundation
import SQLite3

class DataSource{
    static var isFillDataToSQL = false
    static var plistURL:URL!;
    static var dbPath:String!;
    
    
    /*
    static let singleton:DataSource = {
       
        return DataSource()
    }()
     */
     
    static let singleton:DataSource = DataSource()
    
    
    
    static func copyFileToDocuments(){
        guard let sourceUrl = Bundle.main.url(forResource: "citylist", withExtension: "plist") else{
            return
        }
        
        guard let dbUrl = Bundle.main.url(forResource: "city", withExtension: "db") else{
            return
        }
        
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("citylist.plist")
        
        plistURL = documentUrl
        print(documentUrl.path)
        
        let db_documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("city.db")
        dbPath = db_documentUrl.path
        print(db_documentUrl.path)
        
        
        //沒有檔案才copy檔案
        if !FileManager.default.fileExists(atPath: documentUrl.path){
            //檔案不存在
            if (try? FileManager.default.copyItem(at: sourceUrl, to: documentUrl)) != nil{
                print("plist copy 成功")
            }
        }else{
            //檔案存在
            isFillDataToSQL = true;
        }
        
        if !FileManager.default.fileExists(atPath: db_documentUrl.path){
            if (try? FileManager.default.copyItem(at: dbUrl, to: db_documentUrl)) != nil{
                //檔案不存在
                print("db copy 成功")
            }
        }else{
            //檔案存在
            isFillDataToSQL = true;
        }
    }
    
    static func fillSQLiteData(){
        var db:OpaquePointer!
        if sqlite3_open(dbPath, &db) == SQLITE_OK{
            print("db open")
        }else{
            print("db open error")
            return
        }
        
        guard let plist_array = try? NSArray(contentsOf: plistURL, error: ()) else{
            print("解析為NSArray失敗")
            return
        }
        let cities = plist_array as! [[String:Any]]
        for city in cities{
            let sqlInsertString = "INSERT INTO city(cityName,continent,country,image,description,lat,lon,url) VALUES (?,?,?,?,?,?,?,?)"
            var statement:OpaquePointer!
            if sqlite3_prepare_v2(db, sqlInsertString, -1, &statement, nil) == SQLITE_OK{
                print("statement被建立")
            }else{
                print("statement建立失敗")
                sqlite3_finalize(statement)
                sqlite3_close(db)
                return
            }
            
            for (key,value) in city{
                switch key{
                case "City":
                    sqlite3_bind_text(statement, 1, (value as! NSString).utf8String, -1, nil)
                case "Continent":
                    sqlite3_bind_text(statement, 2, (value as! NSString).utf8String, -1, nil)
                case "Country":
                    sqlite3_bind_text(statement, 3, (value as! NSString).utf8String, -1, nil)
                case "Image":
                    sqlite3_bind_text(statement, 4, (value as! NSString).utf8String, -1, nil)
                case "Local":
                    sqlite3_bind_text(statement, 5, (value as! NSString).utf8String, -1, nil)
                case "lat":
                    sqlite3_bind_double(statement, 6, value as! Double)
                case "long":
                    sqlite3_bind_double(statement, 7, value as! Double)
                case "url":
                    sqlite3_bind_text(statement, 8, (value as! NSString).utf8String, -1, nil)
                default:
                    break
                }
            }
            
            if sqlite3_step(statement) == SQLITE_DONE{
                print("insert 成功")
            }
            
            sqlite3_finalize(statement)
        }
        
        sqlite3_close(db)
        print("資料全被加入")
    }    
   
    
    func getCities() -> [City]?{
        var db:OpaquePointer!
        if sqlite3_open(DataSource.dbPath, &db) == SQLITE_OK{
            print("db建立成功")
        }else{
            print("db建立失敗")
            sqlite3_close(db)
            return nil
        }
        
        let citySqlString = "SELECT * FROM city"
        var statement:OpaquePointer!
        if sqlite3_prepare_v2(db, citySqlString, -1, &statement, nil) == SQLITE_OK{
            print("statement建立成功")
        }else{
            print("statement建立成功")
            sqlite3_finalize(statement)
            sqlite3_close(db)
            return nil;
        }
        var cities = [City]()
        while sqlite3_step(statement) == SQLITE_ROW{
            let cityName = String(cString:  sqlite3_column_text(statement, 0))
            let continent = String(cString:  sqlite3_column_text(statement, 1))
            let country = String(cString:  sqlite3_column_text(statement, 2))
            let image = String(cString:  sqlite3_column_text(statement, 3))
            let description = String(cString:  sqlite3_column_text(statement, 4))
            let latitude = sqlite3_column_double(statement, 5)
            let longitude = sqlite3_column_double(statement, 6)
            let url = String(cString:  sqlite3_column_text(statement, 7))
            let city = City(city: cityName, continent: continent, country: country, image: image, description: description, lat: latitude, lon: longitude, url: url)
            cities.append(city)
        }
        sqlite3_finalize(statement)
        sqlite3_close(db)
        return cities
    }
    
    func getContinents() -> [String]?{
        var db:OpaquePointer!
        if sqlite3_open(DataSource.dbPath, &db) == SQLITE_OK{
            print("db建立成功")
        }else{
            print("db建立失敗")
            sqlite3_close(db)
            return nil
        }
        
        let citySqlString = "SELECT  DISTINCT continent FROM city"
        var statement:OpaquePointer!
        if sqlite3_prepare_v2(db, citySqlString, -1, &statement, nil) == SQLITE_OK{
            print("statement建立成功")
        }else{
            print("statement建立成功")
            sqlite3_finalize(statement)
            sqlite3_close(db)
            return nil;
        }
        var continents = [String]()
        while sqlite3_step(statement) == SQLITE_ROW{
            let continent = String(cString:  sqlite3_column_text(statement, 0))
            continents.append(continent)
        }
        sqlite3_finalize(statement)
        sqlite3_close(db)
        return continents        
        
    }
    
    func getCountries(withContinents continent:String)->[String]?{
        var db:OpaquePointer!
        if sqlite3_open(DataSource.dbPath, &db) == SQLITE_OK{
            print("db建立成功")
        }else{
            print("db建立失敗")
            sqlite3_close(db)
            return nil
        }
        
        let sqlString = "SELECT DISTINCT country FROM city WHERE continent=?"
        var statement:OpaquePointer!
        if sqlite3_prepare_v2(db, sqlString, -1, &statement, nil) == SQLITE_OK{
            print("statement建立成功")
        }else{
            print("statement建立成功")
            sqlite3_finalize(statement)
            sqlite3_close(db)
            return nil;
        }
        sqlite3_bind_text(statement, 1, (continent as NSString).utf8String, -1, nil)
        
        var countries = [String]()
        while sqlite3_step(statement) == SQLITE_ROW{
            let country = String(cString:  sqlite3_column_text(statement, 0))
            countries.append(country)
        }
        sqlite3_finalize(statement)
        sqlite3_close(db)
        return countries
        
    }
    
    func getCities(withCountry country:String) -> [City]?{
        return [City]()
    }
}
