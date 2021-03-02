//
//  DataSource.swift
//  lesson22-1
//
//  Created by 徐國堂 on 2021/3/2.
//

import Foundation

class DataSource{
    //singleton class
    //建立type store property
    //property要實作closure的執行
    static let main:DataSource = {
        //這個closure的執行只會被執行一次
        print("closure 被執行了")
        return DataSource()
    }()
    
    //type method
    static func copyFilesToDocuments(){
        //bundle路徑
        let sourcePath = Bundle.main.path(forResource: "citys", ofType: "db")
        
        let targetPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var targetPath = targetPaths.first ?? ""
        targetPath += "/citys.db"
        
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
        var cities:[[String:Any]]! = NSArray(contentsOfFile: plistPath) as? [[String:Any]]
        for city in cities{
            let sqlInsertString = "INSERT INTO city(cityName, continent,country,image,description,lat,lon,url) VALUES (?,?,?,?,?,?,?,?)"
            
            
            print(city)
            print("===========")
        }
        
    }
    
    
}
