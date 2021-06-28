//
//  ViewController.swift
//  lesson8_3
//
//  Created by 徐國堂 on 2021/6/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var navigationBar:UINavigationBar!
    @IBOutlet var heightField:UITextField!
    @IBOutlet var weightField:UITextField!
    @IBOutlet var messageView:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @IBAction func caculate(_ sender:UIButton){
        //optional binding
        if let height = Int(heightField.text!){
            print(height)
        }else{
            print("height有錯誤")
        }
        
        //optional binding
        if let weight = Int(weightField.text!){
            print(weight)
        }else{
            print("weight有錯誤")
        }
        
    }


}

