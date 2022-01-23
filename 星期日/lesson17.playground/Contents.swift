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
