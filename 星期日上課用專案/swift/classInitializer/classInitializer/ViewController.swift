//
//  ViewController.swift
//  classInitializer
//
//  Created by 徐國堂 on 2021/5/2.
//

import UIKit
class Vehicle{
    var numberOfWheels = 0
    var description:String{
        return "\(numberOfWheels)輪子"
    }
}

class Bicycle:Vehicle{
    override init(){
        super.init()
        numberOfWheels = 2
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vehicle = Vehicle()
        print("Vehicle:\(vehicle.description)")
        
        let bicycle = Bicycle()
        print("Bicycle:\(bicycle.description)")
    }


}

