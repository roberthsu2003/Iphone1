//
//  ViewController.swift
//  lesson13_2
//
//  Created by 徐國堂 on 2023/9/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var heightField:UITextField!
    @IBOutlet var weightField:UITextField!
    @IBOutlet var bmiField:UITextField!
    @IBOutlet var messageField:UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiField.text = ""
        messageField.text = ""
        
    }
    
    @IBAction func userClick(_ sender:UIButton){
        if heightField.text == "" || weightField.text == ""{
            let emptyAlert = UIAlertController(title: "出錯", message: "欄位沒有填寫", preferredStyle: .actionSheet)
            emptyAlert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(emptyAlert, animated: true)
            return
        }
        let heightValue = Int(heightField.text!)
        let weightValue = Int(weightField.text!)
        
        var bmi = 0.0
        if let heightValue = heightValue, let weightValue = weightValue{
            bmi = Double(weightValue) / pow(Double(heightValue) / 100.0,2)
        }
        bmiField.text = "BMI: " + String(format: "%.2f", bmi)
        var message = ""
        
        switch bmi{
        case let bmi where bmi < 18.5:
            message = "體重過輕"
        case 18.5 ..< 24:
            message = "標準"
        case 24..<27:
            message = "過重"
        case 27..<30:
            message = "輕度肥胖"
        case 30..<35:
            message = "中度肥胖"
        case let bmi where bmi >= 35:
            message = "重度肥胖"
        default:
            break
        }
        
        messageField.text = message
        
    }


}

