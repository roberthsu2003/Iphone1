//
//  DataSource.swift
//  2lesson19_2
//
//  Created by 徐國堂 on 2024/2/27.
//

import Foundation

class DataSource{
    static var main = DataSource()
    
    private init(){
        guard let sqliteURL = Bundle.main.url(forResource: "city0811", withExtension: "db") else{
            print("沒有這個city0811.db檔")
            return
        }
        //print(sqliteURL.path())
        copySqliteToDocument(sqliteURL: sqliteURL)
    }
    
    private func copySqliteToDocument(sqliteURL:URL){
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("document路徑",documentURL)
            let targetURL = documentURL.appending(path: "city.db", directoryHint: .notDirectory)
            if !fileManager.fileExists(atPath: targetURL.path()){
                try fileManager.copyItem(at: sqliteURL, to: targetURL)
                print("複制city0811.db至document/city.db成功")
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
    }
}
