//
//  ViewController.swift
//  project2
//
//  Created by 徐國堂 on 2022/6/22.
//

import UIKit

struct Rectangle{
    var width = 0
    var height = 0
    var area:Int{
        return width * height
    }
}

class ViewController: UIViewController {
    var rec1 = Rectangle(width: 5, height: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("rec1的寬是\(rec1.width)")
        print("rec1的高是\(rec1.height)")
        print("rec1的面積是\(rec1.area)")
    }


}

