//
//  ViewController.swift
//  lesson2_2
//
//  Created by 徐國堂 on 2021/3/28.
//

import UIKit
struct Point{
    //store property
    var x = 0.0
    var y = 0.0
    
    //computed property
    var sum:Double{
        get{
            return x + y
        }
        
        set(value){
            x = value/2
            y = value/2
        }
    }
}




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var point1 = Point(x: 30, y: 5)
        print(point1.sum)
        point1.sum = 50
        print("x=\(point1.x)")
        print("y=\(point1.y)")
    }


}

