import Foundation
class City{
    var city:String!
    var continent:String!
    var country:String!
    var image:String!
    var local:String!
    var latitude:Double!
    var longitude:Double!
    var url:String!
    
    init(city:String!, continent:String!, country:String!, image:String!, local:String!, lat latitude:Double!,lon longitude:Double!, url:String!){
        self.city = city
        self.continent = continent
        self.country = country
        self.image = image
        self.local = local
        self.latitude = latitude
        self.longitude = longitude
        self.url = url
    }
    
    convenience init(){
        self.init(city:"", continent:"", country:"", image:"", local:"", lat:0.0, lon:0.0, url:"")
    }
}
