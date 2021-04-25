//
//  ViewController.swift
//  initialization
//
//  Created by 徐國堂 on 2021/4/25.
//

import UIKit
struct Fahrenheit{
    var temperature:Double
    init(){
        temperature = 32.0
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let f = Fahrenheit()
        print("華氏溫度是:\(f.temperature)")
    }


}

