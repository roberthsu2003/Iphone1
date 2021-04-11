//
//  ViewController.swift
//  lesson3_2
//
//  Created by 徐國堂 on 2021/4/11.
//

import UIKit
struct Student{
    //store property
    var name:String
    //propert observer
    var chinese:Int=0{
        willSet{
            print("傳進來的值是\(newValue)")
        }
        didSet{
            if chinese > 100 || chinese < 0{
                print("chinese超過範圍，不會有任何改變")
                chinese = oldValue
            }
        }
    }
    var english:Int
    var math:Int
    
    //computed property
    var sum:Int{
          return chinese + english + math
    }
    
    var average:Float{
        return Float(sum) / 3.0
    }
   
}

class ViewController: UIViewController {
    override func awakeFromNib() {
        let counter = Counter() //count=0
        counter.increment() //count=1
        counter.increment(by: 5) //count = 6
        print(counter.count)
        counter.reset()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var student = Student(name: "robert", chinese: 78, english: 92, math: 78)
        print(student.sum)
        print(student.average)
        
        student.chinese = 120
        print("chinese改變後的值是:\(student.chinese)")
        
        print(SomeStructure.storedTypeProperty)
        print(SomeStructure.computedTypeProperty)
    }


}

