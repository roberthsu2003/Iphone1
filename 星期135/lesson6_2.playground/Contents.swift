/*
struct Fahrenheit{
    var temperature:Double
    //自訂的init
    init(){
        temperature = 32.0
    }
}


var f = Fahrenheit()
f.temperature
 */
//store property可以有defaul value

struct Fahrenheit{
    var temperature = 32.0
}

struct Celsius{
    var temperatureInCelsius:Double
    
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius:Double){
        temperatureInCelsius=celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
boilingPointOfWater.temperatureInCelsius
freezingPointOfWater.temperatureInCelsius
let bodyTemperature = Celsius(37.0)
bodyTemperature.temperatureInCelsius

struct Color{
    let red, green, blue:Double
    init(white:Double){
        red = white
        green = white
        blue = white
    }
    
    init(red:Double, green:Double, blue:Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//nil也代表值
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
cheeseQuestion.ask()
cheeseQuestion.response = "是的我喜歡"







