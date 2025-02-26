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
        /*
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
        */
        height_textField.keyboardType = .numberPad
        weight_textField.keyboardType = .numberPad
        //caculate_button.addTarget(self, action: #selector(caculate), for: .touchUpInside)
        caculate_button.addTarget(self, action: #selector(caculate), for: .touchUpInside)
        
    }
    
    @objc func caculate(_ sender:UIButton){
        /*
        guard !height_textField.text!.isEmpty, !weight_textField.text!.isEmpty else{
            print("不可以是空的")
            return
        }
         */
        guard let height_textField_value = height_textField.text,!height_textField_value.isEmpty else{
            print("身高不可以是空的")
            return
        }
        
        guard let weight_textField_value = weight_textField.text,!weight_textField_value.isEmpty else{
            print("體重不可以是空的")
            return
        }
              
        print("身高:\(height_textField_value)")
        print("體重:\(weight_textField_value)")
    }


}

