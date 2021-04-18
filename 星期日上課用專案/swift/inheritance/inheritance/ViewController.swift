//
//  ViewController.swift
//  inheritance
//
//  Created by 徐國堂 on 2021/4/18.
//

import UIKit
class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "目前的速度是\(currentSpeed)公里"
    }
    
    func makeNoise(){
        
    }
    
}

class Bicycle:Vehicle{
    var hasBasket = false
}

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        let someVehicle = Vehicle()
        print("Vehicle:\(someVehicle.description)")
        
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        print("Bicycle:\(bicycle.description)")
        
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        print("Tandem:\(tandem.description)")
    }


}

