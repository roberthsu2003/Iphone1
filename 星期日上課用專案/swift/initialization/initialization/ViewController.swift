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
    
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
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
    }


}

