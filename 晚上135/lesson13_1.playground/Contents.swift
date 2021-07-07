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
    
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

boilingPointOfWater.temperatureInCelsius
freezingPointOfWater.temperatureInCelsius

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

