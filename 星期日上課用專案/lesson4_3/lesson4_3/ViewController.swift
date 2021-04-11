//
//  ViewController.swift
//  lesson4_3
//
//  Created by 徐國堂 on 2021/4/11.
//

import UIKit

class ViewController: UIViewController {
    var directionToHead:CompassPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SomeClass.someTypeMethod()
        directionToHead = CompassPoint.north
        directionToHead = .west
        
        switch directionToHead{
        case .east:
            print("Ease")
        case .north:
            print("North")
        case .south:
            print("South")
        case .west:
            print("West")
        default:
            print("Default")
        }
    }


}

