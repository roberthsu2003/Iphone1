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
    
    
}

let bollingPointOfWater = Celsius(fromFahrenheit: 212.0)
bollingPointOfWater.temperatureInCelsius

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius

