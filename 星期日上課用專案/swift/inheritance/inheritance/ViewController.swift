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

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

