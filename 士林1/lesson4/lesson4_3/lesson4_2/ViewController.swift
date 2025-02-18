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
    @IBOutlet var caculateButton: UIButton!
    @IBOutlet var bmiLabel:UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.numberOfLines = 0
        height_textField.keyboardType = .numberPad
        weight_textField.keyboardType = .numberPad
        bmiLabel.isHidden = true
        height_textField.addTarget(self, action: #selector(hideBMI(_:)), for: .editingDidBegin)
        weight_textField.addTarget(self, action: #selector(hideBMI(_:)), for: .editingDidBegin)
    }
    
    @IBAction func userClick(_ sender:UIButton){
        height_textField.endEditing(true)
        weight_textField.endEditing(true)
        guard height_textField.text != "", weight_textField.text != "" else {
            let emptyAlert = UIAlertController(title: "錯誤", message: "請輸入數值", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            emptyAlert.addAction(okAction)
            present(emptyAlert, animated: true)
            return
        }
        
        if let heightValue = Int(height_textField.text!), let weightValue = Int(weight_textField.text!) {
            let bmiValue = Double(weightValue) / pow(Double(heightValue) / 100, 2)
            var message:String
            if bmiValue < 18.5 {
                message = "過輕"
            } else if bmiValue < 24 {
                message = "正常"
            } else if bmiValue < 27 {
                message = "過重"
            } else {
                message = "肥胖"
            }
            bmiLabel.isHidden = false
            bmiLabel.text = String(format: "%.2f\n%@", bmiValue, message)
        }
    }
    
    @objc func hideBMI(_ sender:Any){
        bmiLabel.isHidden = true
    }


}

