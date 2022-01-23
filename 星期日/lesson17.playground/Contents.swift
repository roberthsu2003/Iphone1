/*
struct Fahrenheit{
    var temperature:Double
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
f.temperature
 */

//default Property Value
struct Fahrenheit{
    var temperature = 32.0
    //closure 的執行
    var temp1:Int = {
        return 32
    }()
}

//有參數的初始化者

struct Celsius{
    var temperatureInCelsius:Double
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    
    //沒有引數名稱的init
    init(_
         celsius:Double){
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelsius

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius

let bodyTemperature = Celsius(37.0)

struct Color{
    let red, green, blue:Double
    init(red:Double, green:Double, blue:Double){
        self.red = red;
        self.green = green;
        self.blue = blue
    }
    
    init(white:Double){
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 0.0)
let halfGray = Color(white: 0.5)

//optional store property

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

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.response = "Yes, I do like cheese."

//defualt initializer
class ShoppingListItem{
    var name:String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//defualt initializer
//memberwise Initializer

struct Size{
    var width = 0.0, heigth = 0.0
}

let twoByTwo = Size(width: 2.0, heigth: 2.0)

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    
    init(origin:Point, size:Size){
        self.origin = origin
        self.size = size
    }
    
    init(center:Point, size:Size){
        let originX  = center.x - (size.width / 2)
        let originY = center.y - (size.heigth / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
