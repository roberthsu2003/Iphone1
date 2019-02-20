//
//  DataSource.swift
//  DataSource
//
//  Created by t1 on 2019/2/17.
//  Copyright © 2019年 gjun. All rights reserved.
//

import Foundation
import SQLite3
//這是singleton的class
class DataSource{
    static var db:OpaquePointer!;
    static var dbTargetPath:String!;
    
    var allCitys:[City]{
        createDb();
        let allCitySqlString = "select * from city";
        var statement:OpaquePointer!;
        if sqlite3_prepare_v2(DataSource.db, allCitySqlString, -1, &statement, nil) == SQLITE_OK{
            print("prepare_v2 ok");
        }else{
            print("prepare_v2 error");
        }
        var citys = [City]();
        while sqlite3_step(statement) == SQLITE_ROW{
            let cityName = String(cString: sqlite3_column_text(statement, 0))
            let continent = String(cString: sqlite3_column_text(statement, 1))
            let country = String(cString: sqlite3_column_text(statement, 2))
            let image = String(cString: sqlite3_column_text(statement, 3))
            let description = String(cString: sqlite3_column_text(statement, 4))
            let latitude = sqlite3_column_double(statement, 5)
            let longitude = sqlite3_column_double(statement, 6)
            let url = String(cString: sqlite3_column_text(statement, 7))
            let city = City(city: cityName, continent: continent, country: country, image: image, local: description, lat: latitude, lon: longitude, url: url);
            citys.append(city);
        }
        sqlite3_finalize(statement);        
        return citys;
    }
    
    func selectedCity(name:String) -> [City]{
        createDb();
        let selectedSqlString = "select * from city where cityName like ?  OR continent like ? OR country  like ? OR description like ?";
        var statement:OpaquePointer!;
        if sqlite3_prepare_v2(DataSource.db, selectedSqlString, -1, &statement, nil) == SQLITE_OK{
            print("prepare_v2 ok");
        }else{
            print("prepare_v2 error");
        }
        sqlite3_bind_text(statement, 1, ("%\(name)%" as NSString).utf8String, -1, nil);
        sqlite3_bind_text(statement, 2, ("%\(name)%" as NSString).utf8String, -1, nil);
        sqlite3_bind_text(statement, 3, ("%\(name)%" as NSString).utf8String, -1, nil);
        sqlite3_bind_text(statement, 4, ("%\(name)%" as NSString).utf8String, -1, nil);
        
        var citys = [City]();
        while sqlite3_step(statement) == SQLITE_ROW{
            let cityName = String(cString: sqlite3_column_text(statement, 0))
            let continent = String(cString: sqlite3_column_text(statement, 1))
            let country = String(cString: sqlite3_column_text(statement, 2))
            let image = String(cString: sqlite3_column_text(statement, 3))
            let description = String(cString: sqlite3_column_text(statement, 4))
            let latitude = sqlite3_column_double(statement, 5)
            let longitude = sqlite3_column_double(statement, 6)
            let url = String(cString: sqlite3_column_text(statement, 7))
            let city = City(city: cityName, continent: continent, country: country, image: image, local: description, lat: latitude, lon: longitude, url: url);
            citys.append(city);
        }
        sqlite3_finalize(statement);
        return citys;
    }
    
    //1建立type property
    static let singleton:DataSource = {
        copyFilesToDocuments();
        return DataSource();
    }();
    
    static func copyFilesToDocuments(){
        //取得mainbundle內的路徑
        let sourcePath = Bundle.main.path(forResource: "citylist", ofType: "plist") ?? "";
        let dbSourcePath = Bundle.main.path(forResource: "citys", ofType: "db") ?? "";
        //取得sandbox Documents的路徑
        let targetPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true);
        var targetPath = targetPaths.first ?? "";
        DataSource.dbTargetPath = targetPaths.first ?? "";
        //sandbox路徑一定要增加檔案名稱
        targetPath += "/citylist.plist"
        DataSource.dbTargetPath += "/citys.db"
        print(DataSource.dbTargetPath);
        //先檢查檔案是否存在
        if !FileManager.default.fileExists(atPath: targetPath){
            if (try? FileManager.default.copyItem(atPath: sourcePath, toPath: targetPath)) == nil {
                print("error");
            }
        }
        
        if !FileManager.default.fileExists(atPath: dbTargetPath){
            if (try? FileManager.default.copyItem(atPath: dbSourcePath, toPath: dbTargetPath)) != nil {
                fillSQLData(plistPath: targetPath, dbPath: dbTargetPath);
            }else{
                print("error");
            }
        }
       
    }
    
    static func fillSQLData(plistPath:String, dbPath:String){
        print("plistPath:\(plistPath)")
        print("dbPath:\(dbPath)")
        if sqlite3_open(dbPath, &db) == SQLITE_OK{
            print("db open");
        }else{
            print("db open failure");
            return;
        }
        let citys = NSArray(contentsOfFile: plistPath) as? [[String:Any]];
        for city in citys!{
            let sqlInsertString = "INSERT INTO city (cityName, continent,country,image,description,lat,lon,url) VALUES (?,?,?,?,?,?,?,?)";
            var statement:OpaquePointer!;
            if sqlite3_prepare_v2(db, sqlInsertString, -1, &statement, nil) == SQLITE_OK{
                print("prepare_v2 ok");
            }else{
                print("prepare_v2 error");
            }
            
            for (key,value) in city{
                switch key {
                    case "City":
                    sqlite3_bind_text(statement, 1, (value as! NSString).utf8String, -1, nil);
                    case "Continent":
                    sqlite3_bind_text(statement, 2, (value as! NSString).utf8String, -1, nil);
                    case "Country":
                    sqlite3_bind_text(statement, 3, (value as! NSString).utf8String, -1, nil);
                    case "Image":
                    sqlite3_bind_text(statement, 4, (value as! NSString).utf8String, -1, nil);
                    case "Local":
                    sqlite3_bind_text(statement, 5, (value as! NSString).utf8String, -1, nil);
                    case "lat":
                    sqlite3_bind_double(statement, 6, value as! Double);
                    case "long":
                    sqlite3_bind_double(statement, 7, value as! Double);
                    case "url":
                    sqlite3_bind_text(statement, 8, (value as! NSString).utf8String, -1, nil);
                    default:
                    break;
                }
            }
            
            if sqlite3_step(statement) == SQLITE_DONE{
                sqlite3_finalize(statement);
                
            }
        }
       
    }
    
    func createDb(){
        if sqlite3_open(DataSource.dbTargetPath, &DataSource.db) == SQLITE_OK{
            print("db open");
        }else{
            print("db open failure");
            return;
        }
    }
    
    //
}
