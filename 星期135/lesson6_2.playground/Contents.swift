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




