//
//  DataSource.swift
//  6_5citydb
//
//  Created by 徐國堂 on 2024/2/27.
//

import Foundation
import SQLite3

class City{
    var name:String
    var continent:String
    var country:String
    var image:String
    var local:String
    var lat:Double
    var long:Double
    var url:String
    init(name: String="", continent: String="", country: String="", image:String="",local: String="", lat: Double=0, long: Double=0, url: String="") {
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
    static var main = DataSource.init()
    var documentSqlitePath:String!
    var db:OpaquePointer! //db的指標,使用c語言的指標
    private init(){
        
        guard let sqliteURL = Bundle.main.url(forResource: "city0811", withExtension: "db") else{
            print("沒有這個city0811.db檔")
            return
        }        
        copySqliteToDocuments(sqliteURL: sqliteURL)
    }
    
    private func copySqliteToDocuments(sqliteURL:URL){
        do {
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("document路徑:",documentURL.path())
            let targetURL = documentURL.appending(path: "city.db", directoryHint: .notDirectory)
            //sqlite等一下要使用這個路徑
            documentSqlitePath = targetURL.path()
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
        guard let plistURL = Bundle.main.url(forResource: "citylist", withExtension: "plist") else{
            print("citylist.plist沒有發現")
            return
        }
        //解析plist的資料
        do{
            let plistData = try Data(contentsOf: plistURL)
            guard let cities = try PropertyListSerialization.propertyList(from: plistData, format: nil) as? [[String:Any]] else{
                print("cities沒有轉換過來")
                return
            }
            //將city的dictionary轉換為City的實體,目的為讓等一下簡化sqlite的bind()的語法
            var tempCities = [City]()
            for cityDict in cities{
                let city = City()
                for (key,value) in cityDict{
                    switch(key){
                    case "City":
                        city.name = value as! String
                    case "Continent":
                        city.continent = value as! String
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
                tempCities.append(city)
            }
            //開始建立sqlite
            guard sqlite3_open(documentSqlitePath, &db) == SQLITE_OK else{
                print("sqlite3_open失敗");
                sqlite3_close(db)
                return
            }
            //db已經建立成功
            for city in tempCities{
                //一個城市建立一個statement
                var statement:OpaquePointer!
                let sqlStatement = "INSERT INTO city (name, continent, country,image,local,lat,long,url) VALUES (?,?,?,?,?,?,?,?)"
                guard sqlite3_prepare_v2(db, sqlStatement, -1, &statement, nil) == SQLITE_OK else{
                    sqlite3_finalize(statement)
                    sqlite3_close(db)
                    print("建立sqlite3_statement失敗")
                    return
                }
                print("建立statement成功")
                sqlite3_bind_text(statement,1,(city.name as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement,2,(city.continent as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement,3,(city.country as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement,4,(city.image as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement,5,(city.local as NSString).utf8String, -1, nil)
                sqlite3_bind_double(statement,6,city.lat)
                sqlite3_bind_double(statement,7,city.long)
                sqlite3_bind_text(statement,8,(city.url as NSString).utf8String, -1, nil)
                //執行
                guard sqlite3_step(statement) == SQLITE_DONE else{
                    print("step失敗")
                    sqlite3_finalize(statement)
                    sqlite3_close(db)
                    return
                }
                sqlite3_finalize(statement)
            }
            //全部建立完成
            //關閉db
            sqlite3_close(db)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func getCitys() -> [City]?{
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
}
