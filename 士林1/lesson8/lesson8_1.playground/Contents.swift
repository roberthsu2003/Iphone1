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








