//
//  city.swift
//  lesson10_2
//
//  Created by 徐國堂 on 2023/4/14.
//

import Foundation
class City{
    var city:String
    var continent:String
    var country:String
    var image:String
    var local:String
    var latitude:Double
    var longitude:Double
    var url:String
    var userRate:String!
    
    init(city: String, continent: String, country: String, image: String, local: String, latitude: Double, longitude: Double, url: String) {
        self.city = city
        self.continent = continent
        self.country = country
        self.image = image
        self.local = local
        self.latitude = latitude
        self.longitude = longitude
        self.url = url
    }
}
