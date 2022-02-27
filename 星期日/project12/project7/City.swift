import Foundation

class City{
    var city:String
    var country:String
    var continent:String
    var image:String
    var local:String
    var latitude:Double
    var longitude:Double
    var url:String
    var userRate = ""
    
    init(city:String,continent:String, country:String, image:String, local:String, lat latitude:Double, lon longitude:Double, url:String){
        self.city = city
        self.country = country
        self.continent = continent
        self.image = image
        self.local = local
        self.latitude = latitude
        self.longitude = longitude
        self.url = url
    }
}
