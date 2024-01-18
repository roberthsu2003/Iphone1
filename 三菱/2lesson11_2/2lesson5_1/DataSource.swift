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
    
}
