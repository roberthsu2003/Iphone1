//
//  DataSource.swift
//  2lesson11_2
//
//  Created by 徐國堂 on 2024/1/18.
//

import Foundation
class City:NSObject,Codable{
    var city:String
    var continent:String
    var country:String
    var image:String
    var local:String
    var lat:Double
    var long:Double
    var url:String
    
    init(city: String, continent: String, country: String, image: String, local: String, lat: Double, long: Double, url: String) {
        self.city = city
        self.continent = continent
        self.country = country
        self.image = image
        self.local = local
        self.lat = lat
        self.long = long
        self.url = url
        super.init()
    }
    
    override var description: String{
        let des = "\(city),\(continent),\(country),\(image),\(local),\(lat),\(long),\(url)"
        return des
    }
    
    func encode(to encoder: NSCoder){
        encoder.encode(self.city, forKey: "city")
        encoder.encode(self.continent, forKey: "continent")
        encoder.encode(self.country, forKey: "country")
        encoder.encode(self.image, forKey: "image")
        encoder.encode(self.local, forKey: "local")
        encoder.encode(self.lat, forKey: "lat")
        encoder.encode(self.long, forKey: "long")
        encoder.encode(self.url, forKey: "url")
    }
    
    required init?(_ decoder:NSCoder) {
        self.city = decoder.decodeObject(of: NSString.self, forKey: "continent")! as String
        self.continent = decoder.decodeObject(of: NSString.self, forKey: "city")! as String
        self.country = decoder.decodeObject(of: NSString.self, forKey: "country")! as String
        self.image = decoder.decodeObject(of: NSString.self, forKey: "image")! as String
        self.local = decoder.decodeObject(of: NSString.self, forKey: "local")! as String
        self.url = decoder.decodeObject(of: NSString.self, forKey: "url")! as String
        self.long = decoder.decodeDouble(forKey: "long")
        self.lat = decoder.decodeDouble(forKey: "lat")
        
    }
}

class DataSource{
    static var main = DataSource.init()
    var cities = [City]()
    private init?(){
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory,
                                              in: .userDomainMask,
                                              appropriateFor: nil,
                                              create: false)
            print(documentURL)
            let fileURL = documentURL.appending(path: "cities.plist")
            if !fileManager.fileExists(atPath: fileURL.path()){
                print("沒有這個檔")
                guard let cities2 = readBundleFile() else{
                    print("讀檔失敗")
                    return
                }
                self.cities = parseCity(cities: cities2)
                print(cities)
                
            }else{
                print("有這個檔")
            }
            
        }
        catch{
            print("error")
        }
    }
    //讀取bundle
    func readBundleFile() -> [[String:Any]]?{
        guard let sourcePath = Bundle.main.url(forResource: "citylist", withExtension: "plist")else{
            print("讀bundle檔出錯")
            return nil
        }
        
        do{
            let sourceData = try Data(contentsOf: sourcePath)
            let cities3 = try PropertyListSerialization.propertyList(from: sourceData, format: nil) as? [[String:Any]] ?? [[String:Any]]()
            return cities3
        }catch{
            print("轉換為Data出錯了")
            print(error)
        }
        
        return nil
    }
    
    func parseCity(cities:[[String:Any]]) -> [City]{
        var cities1 = [City]()
        for item in cities{
            let cityName = item["City"] as? String ?? "空的"
            let continent = item["Continent"] as? String ?? "空的"
            let country = item["Country"] as? String ?? "空的"
            let image = item["Image"] as? String ?? "空的"
            let local = item["Local"] as? String ?? "空的"
            let url = item["url"] as? String ?? "空的"
            let lat = item["lat"] as? Double ?? 0.0
            let long = item["long"] as? Double ?? 0.0
            let city = City(city: cityName, continent: continent, country: country, image: image, local: local, lat: lat, long: long, url: url)
            cities1.append(city)
            
        }
        
        return cities1
    }
}

