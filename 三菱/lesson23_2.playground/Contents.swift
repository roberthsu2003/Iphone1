protocol Named{
    var name:String {get}
}

protocol Aged{
    var age:Int {get}
}

struct Person:Named,Aged{
    var name:String
    var age:Int
}


func wishHappyBirthday(to celebrator:Named&Aged){
    print(celebrator.name, celebrator.age)
}

let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

class Location{
    var latitude:Double
    var longitude:Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
//繼承Location,採納Named
class City:Location, Named{
    var name:String
    init(name:String ,latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location:Location & Named){
    print("Hello, \(location.name)")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)

//利用is, as?, as!檢查實體的型別
protocol HasArea{
    var area:Double {get}
}

class Circle:HasArea{
    let pi = 3.14159
    var radius:Double
    var area:Double{
        pi * radius * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Country:HasArea{
    var area:Double
    init(area: Double) {
        self.area = area
    }
}

class Animal{
    var legs:Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects:[AnyObject] = [Circle(radius: 2.0), Country(area: 243_610), Animal(legs: 4)]

for object in objects{
    if let objecWithArea = object as? HasArea{
        print("Area is \(objecWithArea.area)")
    }else{
        print("沒有Area")
    }
    
}


