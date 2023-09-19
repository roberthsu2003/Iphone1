//初始化完成後所有的store property 必需有值
struct Fahrenheit{
    var temperature:Double
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
print(f.temperature)


struct Fahrenheit1{
    var temperature = 32.0
}

var f1 = Fahrenheit1()
print(f1.temperature)

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
boilingPointOfWater.temperatureInCelsius

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius

let bodyTemperature = Celsius(37.0)

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

//let veryGreen = Color(0.0, 1.0, 0.0)

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

let cheeseQuestion = SurveyQuestion(text: "您喜歡cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Yes, I do like cheese"

//常數,可以在init時,才給值
class SurveyQuestion1{
    let text:String
    var response:String?
    
    init(text:String){
        self.text = text
    }
    
    func ask(){
        print(text)
    }
}

SurveyQuestion1(text: "很熱嗎?")

//Default Initializer

class ShoppingListItem{
    var name:String?
    var quantity = 1
    var purchased = false
}

 var item = ShoppingListItem()
item
