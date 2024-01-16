//
//  ViewController.swift
//  2lesson10_2
//
//  Created by 徐國堂 on 2024/1/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doButton7(_ sender:UIButton){
        print("doButton7")
        let person1 = Person(firstName: "國堂", lastName: "徐")
        print(person1)
    }


}

