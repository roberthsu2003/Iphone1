//
//  DataSource.swift
//  2lesson11_2
//
//  Created by 徐國堂 on 2024/1/18.
//

import Foundation
class City:NSObject{
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
}

class DataSource{
    
}
