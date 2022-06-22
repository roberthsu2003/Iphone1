//
//  ViewController.swift
//  project2
//
//  Created by 徐國堂 on 2022/6/22.
//

import UIKit

struct Rectangle{
    var width:Int = 0{
        didSet{
            if width > 10{
                width = 10
            }else if width < 0{
                width = oldValue
            }
        }
    }
    var height:Int = 0{
        didSet{
            if height > 10{
                height = 10
            }else if height < 0{
                height = oldValue
            }
        }
    }
    var area:Int{
        return width * height
    }
}

class ViewController: UIViewController {
    var rec1 = Rectangle(width: 5, height: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rec1.width = 100
        rec1.height = 100
        rec1.width = -10
        rec1.height = -10
        print("rec1的寬是\(rec1.width)")
        print("rec1的高是\(rec1.height)")
        print("rec1的面積是\(rec1.area)")
        print(add(x: 10, y: 20))
        print(ViewController.sub(x: 20, y: 10))
    }
    
    func add(x:Int, y:Int) -> Int{
        return x + y
    }
    
    
    
    class func sub(x:Int, y:Int) -> Int{
        return x-y
    }


}

