class City{
    var city:String
    var continent:String
    var country:String
    var image:String
    var local:String
    var latiude:Double
    var longitude:Double
    var url:String
    
    init(city:String,continent:String,country:String,image:String,local:String,latiude:Double,longitude:Double,url:String){
        self.city=city
        self.continent=continent
        self.country=country
        self.image=image
        self.local=local
        self.latiude=latiude
        self.longitude=longitude
        self.url = url
    }
    convenience init(){
        self.init(city: "", continent: "", country: "", image: "", local: "", latiude: 0.0, longitude: 0.0, url: "")
    }
}
