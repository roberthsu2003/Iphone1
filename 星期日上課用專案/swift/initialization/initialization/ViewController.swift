//
//  ViewController.swift
//  initialization
//
//  Created by 徐國堂 on 2021/4/25.
//

import UIKit
struct Fahrenheit{
    //default property value
    var temperature = 32.0
    
}

struct Celsius{
    var temperatureInCelsius:Double
    
    init(_ celsius:Double){
        temperatureInCelsius = celsius
    }
    
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
}

struct Color{
    let red, green, blue:Double
    var response:String?
    
    init(red:Double, green:Double, blue:Double){
        self.red = red
        self.blue = blue
        self.green = green
    }
    
    init(white:Double){
        red = white
        green = white
        blue = white
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let f = Fahrenheit()
        print("華氏溫度是:\(f.temperature)")
        
        let boilingPointOfWater = Celsius(fromFahrenheit: 212)
        print("攝氏溫度的沸點是\(boilingPointOfWater.temperatureInCelsius)")
        
        let freezingPointerOfWater = Celsius(fromKelvin: 273.15)
        print("攝氏溫度的零度是:\(freezingPointerOfWater.temperatureInCelsius)")
        
        
        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
        let halfGray = Color(white: 0.5)
        //let veryGreen = Color(0.0, 1.0, 0.0) 錯誤的
        
        
        let bodyTemperature = Celsius(37.0)
    }


}

