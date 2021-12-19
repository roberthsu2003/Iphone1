//
//  ViewController.swift
//  project2
//
//  Created by alicehsu on 2021/12/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myLabel.text!) //強制打開，如果是nil就crash
        
        print(myLabel.text ?? "text內容是nil") //使用nil運算子檢查
        
        if let textString = myLabel.text{ //使用optional binding 檢查
            print(textString)
        }else{
            print("text內容是nil")
        }
    }


}

