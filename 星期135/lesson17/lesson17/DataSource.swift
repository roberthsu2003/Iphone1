//
//  DataSource.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/7/29.
//

import Foundation
class DataSource{
    static var isFillDataToSQL = false
    static func copyFileToDocuments(){
        guard let sourceUrl = Bundle.main.url(forResource: "citylist", withExtension: "plist") else{
            return
        }
        
        guard let dbUrl = Bundle.main.url(forResource: "city", withExtension: "db") else{
            return
        }
        
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("citylist.plist")
        print(documentUrl.path)
        
        let db_documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("city.db")
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
        print("fillSQLiteData")
    }
}
