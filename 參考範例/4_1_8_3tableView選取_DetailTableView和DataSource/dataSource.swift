//
//  dataSource.swift
//  4_1_tableView
//
//  Created by 徐國堂 on 2024/1/11.
//
import Foundation

class City:NSObject,NSSecureCoding,Codable{
    static var supportsSecureCoding: Bool{
        return true
    }
    
    var city:String
    var continent:String
    var country:String
    var image:String
    var local:String
    var lat:Double
    var long:Double
    var url:String
    
    init(city:String, continent:String, country:String, image:String, local:String, lat:Double, long:Double, url:String)
    {
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
        return "\(self.city),\(self.continent),\(self.country),\(self.image),\(self.local),\(self.lat),\(self.long),\(self.url)"
    }
    
    func encode(with coder: NSCoder)
    {
        coder.encode(self.city , forKey: "city")
        coder.encode(self.continent, forKey: "continent")
        coder.encode(self.country, forKey: "country")
        coder.encode(self.image, forKey: "image")
        coder.encode(self.local, forKey: "local")
        coder.encode(self.lat, forKey:"lat")
        coder.encode(self.long, forKey: "long")
        coder.encode(self.url, forKey: "url")
    }
    
    required init?(coder:NSCoder)
    {
        self.city = coder.decodeObject(of: NSString.self , forKey: "city")! as String
        self.continent = coder.decodeObject(of: NSString.self , forKey: "continent")! as String
        self.country = coder.decodeObject(of: NSString.self, forKey: "country")! as String
        self.image = coder.decodeObject(of: NSString.self, forKey: "image")! as String
        self.local = coder.decodeObject(of: NSString.self, forKey: "local")! as String
        self.lat = coder.decodeObject(of: NSNumber.self, forKey: "lat")! as! Double
        self.long = coder.decodeDouble(forKey: "long")
        self.url = coder.decodeObject(of: NSString.self, forKey: "url")! as String
    }
    
    
}


class DataSource{
    var cities = [City]()
    static let main:DataSource = {
        return DataSource()
    }()
    
    private init(){
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = documentURL.appending(path: "citys.plist", directoryHint: .notDirectory)
            if !fileManager.fileExists(atPath: fileURL.path()){
                //檔案不存在
                print("檔案不存在")
                print(fileURL)
                guard let cities2 = readBundleFile() else{
                    return
                }
                self.cities = parseCity(cities: cities2)
                saveCityToDocuments(cities: self.cities)
            }else{
                //有檔案存在
                let plister = PropertyListDecoder()
                let data = try Data(contentsOf: fileURL)
                self.cities = try plister.decode([City].self, from: data)
                
            }
        }catch{
            print(error)
        }
    }
    
    func readBundleFile() -> [[String:Any]]?{
        var cities3 = [[String:Any]]()
        guard let sourcePath = Bundle.main.url(forResource: "citylist", withExtension: "plist") else
        {
            print("Bundle解析錯誤")
            return nil
        }
        do
        {
            let sourceData = try Data(contentsOf: sourcePath)
            cities3 = try PropertyListSerialization.propertyList(from: sourceData, format: nil) as? [[String:Any]] ?? [[String:Any]]()
        }
        catch
        {
            print(error)
        }
        return cities3
    }
    
    func parseCity(cities:[[String:Any]])->[City]{
        //轉換[[String:Any]])->[City]
        var cities1 = [City]()
        for item in cities{
            let cityName = item["City"] as? String ?? "空的"
            let continent = item["Continent"] as? String ?? "空的"
            let country = item["Country"] as? String ?? "空的"
            let image = item["Image"] as? String ?? "空的"
            let local = item["Local"] as? String ?? "空的"
            let lat = item["lat"] as? Double ?? 0.0
            let long = item["long"] as? Double ?? 0.0
            let url = item["url"] as? String ?? "空的"
            let city = City(city: cityName, continent: continent, country: country, image: image, local: local, lat: lat, long: long, url: url)
            cities1.append(city)
        }
        return cities1
    }
    
    func saveCityToDocuments(cities:[City]){
        do{
            let fileManager = FileManager.default
            let documentFile = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            let cityFile = documentFile.appending(path: "citys.plist", directoryHint: .notDirectory)
            let plister = PropertyListEncoder()
            try plister.encode(cities).write(to: cityFile, options: .atomic)
        }catch{
            print(error)
        }
        
    }
    
    
}
