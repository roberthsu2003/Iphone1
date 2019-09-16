//
//  DataSource.swift
//  citys07_21
//
//  Created by HsuYuNien on 2019/7/21.
//  Copyright © 2019 ios1. All rights reserved.
//

import Foundation
import SQLite3



class City{
    /*
    let city:String
    let continent:String
    let country:String
    let local:String
    let lat:Double
    let long:Double
    let url:String
    */
    var name = ""
    var continent = ""
    var country = ""
    var image = ""
    var local = ""
    var lat = 0.0
    var long = 0.0
    var url = ""
    
    init(){
        
    }
    
    init(name:String, continent:String, country:String, image:String, local:String, lat:Double, long:Double, url:String){
        self.name = name
        self.continent = continent
        self.country = country
        self.image = image
        self.local = local
        self.lat = lat
        self.long = long
        self.url = url
    }
}

class DataSource{
    //var citys = [[String:Any]]()
    var citys:[City]?{
        return getCitys();
    }
    static var main = DataSource.init()
    let plistPath = Bundle.main.path(forResource: "citylist", ofType: "plist")
    var  documentSqlitePath:String!;
    var db:OpaquePointer!;
    
    subscript(continent:String) -> [City]?{
        guard sqlite3_open(documentSqlitePath, &db) == SQLITE_OK else {
            print("sqlite3_open失敗");
            sqlite3_close(db)
            return nil;
        }
        var statement:OpaquePointer!
        
        let sqlStatement = "SELECT name,continent,country,image,local,lat,long,url FROM city where continent = ?";
        
        guard sqlite3_prepare_v2(db, sqlStatement, -1, &statement, nil) == SQLITE_OK else{
            sqlite3_finalize(statement)
            print("建立sqlite3_stement失敗")
            return nil;
        }
        
        sqlite3_bind_text(statement, 1, (continent as NSString).utf8String, -1, nil)
        
        var tempCitys = [City]();
        while sqlite3_step(statement) == SQLITE_ROW{
            let name = String(cString: sqlite3_column_text(statement, 0))
            let continent = String(cString: sqlite3_column_text(statement, 1))
            let country = String(cString: sqlite3_column_text(statement, 2))
            let image = String(cString: sqlite3_column_text(statement, 3))
            let local = String(cString: sqlite3_column_text(statement, 4))
            let lat = sqlite3_column_double(statement, 5)
            let long = sqlite3_column_double(statement, 6)
            let url = String(cString: sqlite3_column_text(statement, 7))
            let city = City(name: name, continent: continent, country: country, image: image, local: local, lat: lat, long: long, url: url);
            tempCitys.append(city)
        }
        sqlite3_finalize(statement)
        return tempCitys;
        
        
    }
    
    var countries:[String]?{
        guard sqlite3_open(documentSqlitePath, &db) == SQLITE_OK else {
            print("sqlite3_open失敗");
            sqlite3_close(db)
            return nil;
        }
        var statement:OpaquePointer!
        
        let sqlStatement = "SELECT country FROM city GROUP BY country";
        guard sqlite3_prepare_v2(db, sqlStatement, -1, &statement, nil) == SQLITE_OK else{
            sqlite3_finalize(statement)
            print("建立sqlite3_stement失敗")
            return nil;
        }
        var tempCountries = [String]();
        while sqlite3_step(statement) == SQLITE_ROW{
            let country = String(cString: sqlite3_column_text(statement, 0))
            tempCountries.append(country)
        }
        
        sqlite3_finalize(statement)
        return tempCountries;
        
    }
    
    func getCitiesOfCountry(countryName:String) -> [City]?{
        guard sqlite3_open(documentSqlitePath, &db) == SQLITE_OK else {
            print("sqlite3_open失敗");
            sqlite3_close(db)
            return nil;
        }
        var statement:OpaquePointer!
        
        let sqlStatement = "SELECT name,continent,country,image,local,lat,long,url FROM city where country = ?";
        
        guard sqlite3_prepare_v2(db, sqlStatement, -1, &statement, nil) == SQLITE_OK else{
            sqlite3_finalize(statement)
            print("建立sqlite3_stement失敗")
            return nil;
        }
        
        sqlite3_bind_text(statement, 1, (countryName as NSString).utf8String, -1, nil)
        
        var tempCitys = [City]();
        while sqlite3_step(statement) == SQLITE_ROW{
            let name = String(cString: sqlite3_column_text(statement, 0))
            let continent = String(cString: sqlite3_column_text(statement, 1))
            let country = String(cString: sqlite3_column_text(statement, 2))
            let image = String(cString: sqlite3_column_text(statement, 3))
            let local = String(cString: sqlite3_column_text(statement, 4))
            let lat = sqlite3_column_double(statement, 5)
            let long = sqlite3_column_double(statement, 6)
            let url = String(cString: sqlite3_column_text(statement, 7))
            let city = City(name: name, continent: continent, country: country, image: image, local: local, lat: lat, long: long, url: url);
            tempCitys.append(city)
        }
        sqlite3_finalize(statement)
        return tempCitys;
    }
    
    //存取限制
    private init(){
        //多做一些初始化動作
        //main bundle 解析 plist 的絕對路徑 -> Bundle 類別
        
        let sqlitePath = Bundle.main.path(forResource: "city0811", ofType: "db")
        
        //0804
        copySqliteToDocuments(sqlitePath: sqlitePath!);
        
        
        //有絕對路徑後，可以使用NSDictionary，NSArray 建立實體
        //let nsArray = NSArray(contentsOfFile: path!)
        
        //08011
        
    }
    
    //0804
    private func copySqliteToDocuments(sqlitePath:String){
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsPath = paths.first! + "/city0811.db"
        self.documentSqlitePath = documentsPath
        print("documentsPath：\(documentsPath)")
        if !FileManager.default.fileExists(atPath: documentsPath){
            
            if (try? FileManager.default.copyItem(atPath: sqlitePath, toPath: documentsPath)) != nil{
                print("copy成功")
                plistFillDataToSqlite(documentSqlitePath: documentsPath)
            }
           
            
        }
        
       
    }
    
    private func plistFillDataToSqlite(documentSqlitePath:String){
        let nsArray = NSArray(contentsOfFile: plistPath!);
        var tempCitys = [City]();
        //citys = nsArray as! [[String:Any]]
        //得到了陣列內有dictionary
        let dicOfcitys = nsArray as! [[String:Any]]
        for cityDic  in dicOfcitys{
            let city = City()
            for (key,value) in cityDic{
                switch(key){
                case "City":
                    city.name = value as! String
                case "Continent":
                    city.continent = value as! String
                case "Country":
                    city.country = value as! String
                case "Image":
                    city.image = value as! String
                case "Local":
                    city.local = value as! String
                case "url":
                    city.url = value as! String
                case "long":
                    city.long = value as! Double
                case "lat":
                    city.lat = value as! Double
                default:
                    break
                }
            }
            
            tempCitys.append(city)
        }
        
        //tempCitys的陣列內的City 資料加入至SQLite
        print(tempCitys);
        //建立db
        
        guard sqlite3_open(documentSqlitePath, &db) == SQLITE_OK else {
            print("sqlite3_open失敗");
            sqlite3_close(db)
            return
        }
        for city in tempCitys{
            var statement:OpaquePointer!
            let sqlStatement = "INSERT INTO city (name, continent, country,image,local,lat,long,url) VALUES (?,?,?,?,?,?,?,?)";
            guard sqlite3_prepare_v2(db, sqlStatement, -1, &statement, nil) == SQLITE_OK else{
                sqlite3_finalize(statement)
                sqlite3_close(db)
                print("建立sqlite3_stement失敗")
                return;
            }
            
            print("建立statement成功");
            
            sqlite3_bind_text(statement, 1, (city.name as NSString).utf8String, -1, nil);
            sqlite3_bind_text(statement, 2, (city.continent as NSString).utf8String, -1, nil);
            sqlite3_bind_text(statement, 3, (city.country as NSString).utf8String, -1, nil);
            sqlite3_bind_text(statement, 4, (city.image as NSString).utf8String, -1, nil);
            sqlite3_bind_text(statement, 5, (city.local as NSString).utf8String, -1, nil);
            sqlite3_bind_double(statement, 6, city.lat)
            sqlite3_bind_double(statement, 7, city.long)
            sqlite3_bind_text(statement, 8, (city.url as NSString).utf8String, -1, nil);
            guard sqlite3_step(statement) == SQLITE_DONE else{
                print("step失敗");
                sqlite3_finalize(statement)
                sqlite3_close(db)
                return
            }
            sqlite3_finalize(statement)
            print("新增成功");
        }
        
    }
    
    private func getCitys() -> [City]?{
        guard sqlite3_open(documentSqlitePath, &db) == SQLITE_OK else {
            print("sqlite3_open失敗");
            sqlite3_close(db)
            return nil;
        }
        var statement:OpaquePointer!
        
        let sqlStatement = "SELECT name,continent,country,image,local,lat,long,url FROM city";
        guard sqlite3_prepare_v2(db, sqlStatement, -1, &statement, nil) == SQLITE_OK else{
            sqlite3_finalize(statement)
            print("建立sqlite3_stement失敗")
            return nil;
        }
        var tempCitys = [City]();
        while sqlite3_step(statement) == SQLITE_ROW{
            let name = String(cString: sqlite3_column_text(statement, 0))
            let continent = String(cString: sqlite3_column_text(statement, 1))
            let country = String(cString: sqlite3_column_text(statement, 2))
            let image = String(cString: sqlite3_column_text(statement, 3))
            let local = String(cString: sqlite3_column_text(statement, 4))
            let lat = sqlite3_column_double(statement, 5)
            let long = sqlite3_column_double(statement, 6)
            let url = String(cString: sqlite3_column_text(statement, 7))
            let city = City(name: name, continent: continent, country: country, image: image, local: local, lat: lat, long: long, url: url);
            tempCitys.append(city)
        }
        sqlite3_finalize(statement)
        return tempCitys;
        
    }
    
    func searchCity(searchValue:String) -> [City]?{
        
        guard sqlite3_open(documentSqlitePath, &db) == SQLITE_OK else {
            print("sqlite3_open失敗");
            sqlite3_close(db)
            return nil;
        }
        var statement:OpaquePointer!
        
        let sqlStatement = "SELECT name,continent,country,image,local,lat,long,url FROM city WHERE name LIKE ? OR continent LIKE ?  OR country LIKE ? OR local LIKE ?";
        guard sqlite3_prepare_v2(db, sqlStatement, -1, &statement, nil) == SQLITE_OK else{
            sqlite3_finalize(statement)
            print("建立sqlite3_stement失敗")
            return nil;
        }
        
        sqlite3_bind_text(statement, 1, ("%\(searchValue)%" as NSString).utf8String, -1, nil);
        sqlite3_bind_text(statement, 2, ("%\(searchValue)%" as NSString).utf8String, -1, nil);
        sqlite3_bind_text(statement, 3, ("%\(searchValue)%" as NSString).utf8String, -1, nil);
        sqlite3_bind_text(statement, 4, ("%\(searchValue)%" as NSString).utf8String, -1, nil);
        
        
        var tempCitys = [City]();
        while sqlite3_step(statement) == SQLITE_ROW{
            let name = String(cString: sqlite3_column_text(statement, 0))
            let continent = String(cString: sqlite3_column_text(statement, 1))
            let country = String(cString: sqlite3_column_text(statement, 2))
            let image = String(cString: sqlite3_column_text(statement, 3))
            let local = String(cString: sqlite3_column_text(statement, 4))
            let lat = sqlite3_column_double(statement, 5)
            let long = sqlite3_column_double(statement, 6)
            let url = String(cString: sqlite3_column_text(statement, 7))
            let city = City(name: name, continent: continent, country: country, image: image, local: local, lat: lat, long: long, url: url);
            tempCitys.append(city)
        }
        sqlite3_finalize(statement)
        
        return tempCitys;
       
    }
    
}
