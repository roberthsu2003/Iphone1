/*
struct Fahrenhiet{
    var temperature:Double
    init(){
        temperature = 32.0
    }
}
 */

struct Fahrenhiet{
    var temperature = 32.0
}


var f = Fahrenhiet()
f.temperature

struct Celsius{
    var temperatureInCelsius:Double
    
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit-32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius:Double){
        temperatureInCelsius = celsius
    }
    
    
}

let bollingPointOfWater = Celsius(fromFahrenheit: 212.0)
bollingPointOfWater.temperatureInCelsius

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius

let bodyTemperature = Celsius(37.0)
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

