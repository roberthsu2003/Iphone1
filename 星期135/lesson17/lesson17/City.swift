//
//  City.swift
//  project12
//
//  Created by 徐國堂 on 2022/7/11.
//

import Foundation

class City{
    var city:String
    var continent:String
    var country:String
    var image:String
    var description:String
    var latitude:Double
    var longitude:Double
    var url:String
    
    
    init(city:String, continent:String, country:String, image:String, description:String, lat latitude:Double, lon longitude:Double, url:String){
        self.city = city
        self.continent = continent
        self.country = country
        self.image = image
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.url = url
    }
    
}
