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
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelsius

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
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

//let veryGreen = Color(0.0, 1.0, 0.0)

