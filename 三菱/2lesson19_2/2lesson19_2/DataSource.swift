//
//  DataSource.swift
//  2lesson19_2
//
//  Created by 徐國堂 on 2024/2/27.
//

import Foundation
class City{
    var name:String
    var continent:String
    var country:String
    var image:String
    var local:String
    var lat:Double
    var long:Double
    var url:String
    init(name: String="", continent: String="", country: String="", image: String="", local: String="", lat: Double=0, long: Double=0, url: String="") {
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
                plistFillDataToSqlite(documentSqliteURL: targetURL)
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    private func plistFillDataToSqlite(documentSqliteURL:URL){
        guard let plistURL = Bundle.main.url(forResource: "citylist", withExtension: "plist")else{
            print("cityplist.plist沒有發現")
            return
        }
        do{
            let plistData = try Data(contentsOf: plistURL)
            guard let cities = try PropertyListSerialization.propertyList(from: plistData, format: nil) as? [[String:Any]] else{
                print("plist無法轉換為swift資料結構")
                return
            }
            print(cities)
            
        }catch{
            print(error.localizedDescription)
        }
        
    }
}
