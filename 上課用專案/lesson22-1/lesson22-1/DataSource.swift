//
//  DataSource.swift
//  lesson22-1
//
//  Created by 徐國堂 on 2021/3/2.
//

import Foundation
import SQLite3

class DataSource{
    //singleton class
    //建立type store property
    //property要實作closure的執行
    static var db:OpaquePointer!;
    static var dbTagetPath:String!;
    
    static let main:DataSource = {
        //這個closure的執行只會被執行一次
        print("closure 被執行了")
        var targetPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        dbTagetPath = targetPaths.first ?? ""
        dbTagetPath += "/citys.db"
        if sqlite3_open(dbTagetPath, &db) == SQLITE_OK{
            print("db open")
        }else{
            print("db open 錯誤")
        }
        return DataSource()
    }()
    
    //computed property
    var allCitys:[City]{
        //print(DataSource.db)
        let allCitySqlString = "select * from city"
        var statement:OpaquePointer!
        if sqlite3_prepare_v2(DataSource.db, allCitySqlString, -1, &statement, nil) == SQLITE_OK{
            print("prepare_v2 ok");
        }else{
            print("prepare_v2 error");
        }
        var citys = [City]()
        while sqlite3_step(statement) == SQLITE_ROW{
            let cityName = String(cString: sqlite3_column_text(statement, 0))
            let continent = String(cString: sqlite3_column_text(statement, 1))
            let country = String(cString: sqlite3_column_text(statement, 2))
            let image = String(cString: sqlite3_column_text(statement, 3))
            let description = String(cString: sqlite3_column_text(statement, 4))
            let latitude = sqlite3_column_double(statement, 5)
            let longitude = sqlite3_column_double(statement, 6)
            let url = String(cString: sqlite3_column_text(statement, 7))
            let city = City(city: cityName, continent: continent, country: country, image: image, local: description, lat: latitude, lon: longitude, url: url)
            citys.append(city)
        }
        sqlite3_finalize(statement)
        return citys
    }
    
    func selectedCity(name:String) -> [City]{
        let selectedSqlString = "select * from city where cityName like ?  OR continent like ? OR country  like ? OR description like ?"
        var statement:OpaquePointer!
        if sqlite3_prepare_v2(DataSource.db, selectedSqlString, -1, &statement, nil) == SQLITE_OK{
            print("prepare_v2 ok");
        }else{
            print("prepare_v2 error");
        }
        sqlite3_bind_text(statement, 1, ("%\(name)%" as NSString).utf8String, -1, nil)
        sqlite3_bind_text(statement, 2, ("%\(name)%" as NSString).utf8String, -1, nil)
        sqlite3_bind_text(statement, 3, ("%\(name)%" as NSString).utf8String, -1, nil)
        sqlite3_bind_text(statement, 4, ("%\(name)%" as NSString).utf8String, -1, nil)
        var citys = [City]()
        while sqlite3_step(statement) == SQLITE_ROW{
            let cityName = String(cString: sqlite3_column_text(statement, 0))
            let continent = String(cString: sqlite3_column_text(statement, 1))
            let country = String(cString: sqlite3_column_text(statement, 2))
            let image = String(cString: sqlite3_column_text(statement, 3))
            let description = String(cString: sqlite3_column_text(statement, 4))
            let latitude = sqlite3_column_double(statement, 5)
            let longitude = sqlite3_column_double(statement, 6)
            let url = String(cString: sqlite3_column_text(statement, 7))
            let city = City(city: cityName, continent: continent, country: country, image: image, local: description, lat: latitude, lon: longitude, url: url)
            citys.append(city)
        }
        sqlite3_finalize(statement)
        return citys
}
    
    //type method
    static func copyFilesToDocuments(){
        //bundle路徑
        let sourcePath = Bundle.main.path(forResource: "citys", ofType: "db")
        
        let targetPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var targetPath = targetPaths.first ?? ""
        targetPath += "/citys.db"
        print(targetPath)
        
        if !FileManager.default.fileExists(atPath: targetPath){
            
            if (try? FileManager.default.copyItem(atPath: sourcePath!, toPath: targetPath)) == nil{
                print("copy 失敗")
                return
            }
            //手動將plist內的資料儲存到db檔案內
            let plistSourcePath = Bundle.main.path(forResource: "citylist", ofType: "plist")
            fillSQLData(plistPath: plistSourcePath!, dbTagetPath: targetPath)
        }
    }
    
    static func fillSQLData(plistPath:String, dbTagetPath:String){
        print("plist路徑:\(plistPath)")
        print("db路徑:\(dbTagetPath)")
        if sqlite3_open(dbTagetPath, &db) == SQLITE_OK{
            print("db open")
        }else{
            print("db open 錯誤")
        }
        var cities:[[String:Any]]! = NSArray(contentsOfFile: plistPath) as? [[String:Any]]
        for city in cities{
            var statement:OpaquePointer!
            let sqlInsertString = "INSERT INTO city(cityName, continent,country,image,description,lat,lon,url) VALUES (?,?,?,?,?,?,?,?)"
            if sqlite3_prepare_v2(db, sqlInsertString, -1, &statement, nil) == SQLITE_OK{
                //print("stament 建立了")
            }else{
                //print("stament 建立失敗")
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
                print("插入一筆成功")
                sqlite3_finalize(statement)
            }
            
            //print(city)
            //print("===========")
        }
        
    }
    
    
}
