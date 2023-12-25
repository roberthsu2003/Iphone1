//
//  City.swift
//  collectionView
//
//  Created by 徐國堂 on 2023/12/25.
//

import Foundation
class City:NSObject,NSSecureCoding,Codable{
    static var supportsSecureCoding: Bool{
        return true
    }
    
    var city:String
    var continent:String
    var country:String
    var image:Data
    var local:String
    var lat:Double
    var long:Double
    var url:String
    
    init(city:String, continent:String, country:String, image:Data, local:String, lat:Double, long:Double, url:String)
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
        return "\(self.city),\(self.continent),\(self.country),\(self.local),\(self.lat),\(self.long),\(self.url)"
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
        self.country = coder.decodeObject(of: NSString.self, forKey: "country") as? String ?? ""
        self.image = coder.decodeObject(of: NSData.self, forKey: "image") as? Data ?? Data()
        self.local = coder.decodeObject(of: NSString.self, forKey: "local") as? String ?? ""
        self.lat = coder.decodeObject(of: NSNumber.self, forKey: "lat") as? Double ?? 0.0
        self.long = coder.decodeDouble(forKey: "long")
        self.url = coder.decodeObject(of: NSString.self, forKey: "url") as? String ?? ""
    }
    
    
}
