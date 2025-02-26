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
    @IBOutlet var bmi_textField: UITextField!
    @IBOutlet var message_textField: UITextField!
    
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
        message_textField.isUserInteractionEnabled = false
        
    }
    
    @objc func caculate(_ sender:UIButton){
        /*
        guard !height_textField.text!.isEmpty, !weight_textField.text!.isEmpty else{
            print("不可以是空的")
            return
        }
         */
        guard let height_textField_value = height_textField.text,!height_textField_value.isEmpty else{
            //提早離開
            //let height_textField_value = height_textField.text(optional binding)
            displayAlertController(title: "身高", message: "身高不可以是空的")
            return
        }
        
        guard let weight_textField_value = weight_textField.text,!weight_textField_value.isEmpty else{
            displayAlertController(title: "體重", message: "體重不可以是空的")
            return
        }
        
        func displayAlertController(title:String,message:String){
            let emptyAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            emptyAlertController.addAction(okAction)
            self.present(emptyAlertController, animated: true, completion: nil)
        }
              
        guard let height = Int(height_textField_value), let weight = Int(weight_textField_value) else{
            displayAlertController(title: "數字格式錯誤", message: "請輸入正確的數字")
            return
        }
        
        let bmi = Double(weight) / pow(Double(height)/100.0, 2)
        bmi_textField.text = "BMI:\(String(format: "%.2f", bmi))"
        var message = ""
        var color:UIColor = .systemRed
        switch bmi{
            case ..<18.5:
            message = "過輕"
        case 18.5...24.9:
            message = "正常"
            color = .systemBlue
        case 25...29.9:
            message = "過重"
        default:
            message = "肥胖"
        }
        message_textField.text = message
        message_textField.textColor = color
        height_textField.resignFirstResponder()
        weight_textField.resignFirstResponder()
        
    }
    
    @IBAction func userWillTapField(_ sender:UITextField){
        bmi_textField.text = nil
        message_textField.text = nil
    }


}

