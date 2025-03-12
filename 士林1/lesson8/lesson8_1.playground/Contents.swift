struct Fahrenheit{
    var temperature: Double
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
f.temperature

struct Fahrenheit1{
    var temperature = 32.0
}

var f1 = Fahrenheit1()
f1.temperature

struct Celsius{
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32) * 5 / 9
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celcius:Double){
        temperatureInCelsius = celcius
    }
}

let boilingPointOfWaterInCelsius = Celsius(fromFahrenheit: 212.0)

let freezingPointOfWaterInCelsius = Celsius(fromKelvin: 273.15)

let bodyTemperatureInCelsius = Celsius(36.0)

class SurveyQuestion{
    let text:String
    var response:String?
    
    init(text:String){
        self.text = text
    }
    
    func ask(){
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Yes, please!"

//Default initializers
class ShoppingListItem{
    var name:String?
    var quantity = 1
    var purchased = false
}

var item1 = ShoppingListItem()

struct Size{
    var width = 0.0, height = 0.0
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    init(){}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init (center: Point, size: Size){
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}











