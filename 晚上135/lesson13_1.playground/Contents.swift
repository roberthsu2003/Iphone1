struct Fahrenheit{
    var temperature = 32.0
    /*
    init(){
        temperature = 32.0
    }
 */
}

var f = Fahrenheit(temperature: 40)
print("華氏溫度是\(f.temperature)")

struct Celsius{
    var temperatureInCelsius:Double
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius:Double){
        temperatureInCelsius = celsius
    }
    
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
let bodyTemperature = Celsius(37.0)

boilingPointOfWater.temperatureInCelsius
freezingPointOfWater.temperatureInCelsius
bodyTemperature.temperatureInCelsius

struct Color{
    let red, green, blue:Double
    
    init(red:Double, green:Double, blue:Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white:Double){
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)

let halfGray = Color(white: 0.5)

class SurveyQuestion{
    var text:String
    var response:String?
    
    init(text:String){
        self.text = text
    }
    
    func ask(){
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "您喜歡cheese嗎?")
cheeseQuestion.response = "是的，我喜歡cheese"

class ShoppingListItem{
    var name:String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

struct Size1{
    var width = 0.0, height = 0.0
}
let twoByTwo = Size1(width: 2.0, height: 2.0)

struct Size{
    var width = 0.0, height = 0.0
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    init(){
        
    }
    init(origin:Point, size:Size){
        self.origin = origin
        self.size = size
    }
    
    init(center:Point, size:Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

let basicRect = Rect()

let centerRect = Rect(center: Point.init(x: 4.0, y: 4.0), size: Size.init(width: 3.0, height: 3.0))




