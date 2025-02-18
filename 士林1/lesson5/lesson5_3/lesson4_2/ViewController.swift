//
//  ViewController.swift
//  lesson4_2
//
//  Created by 徐國堂 on 2025/2/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var height_textField: UITextField!
    @IBOutlet var weight_textField: UITextField!
    @IBOutlet var caculate_button:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //force unwrapping
        print(height_textField.text!)
        //optional binding
        /*
        if let weight_value = weight_textField.text, !weight_value.isEmpty{
            print("不是空的")
        }else{
            print("是空的")
        }
         */
        guard let weight_value = weight_textField.text, !weight_value.isEmpty else {
            print("是空的")
            return
        }
        
        print(weight_value)
        
        
        
        
    }


}

