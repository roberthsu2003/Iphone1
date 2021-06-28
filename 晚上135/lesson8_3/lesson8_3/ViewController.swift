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
        if let height = Int(heightField.text!),let weight = Int(weightField.text!){
            print(height)
            print(weight)
        }else{
            print("有錯誤")
        }
        
       
        
    }


}

