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
    var chinese:Int
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

    override func viewDidLoad() {
        super.viewDidLoad()
        let student = Student(name: "robert", chinese: 78, english: 92, math: 78)
        print(student.sum)
        print(student.average)
    }


}

