//
//  ViewController.swift
//  test1
//
//  Created by 徐國堂 on 2023/9/12.
//
//相對應的專案半自動建立constraints1
import UIKit

class ViewController: UIViewController {
    @IBOutlet var heigtLabel:UILabel!
    @IBOutlet var heightField:UITextField!
    @IBOutlet var weightLabel:UILabel!
    @IBOutlet var weightField:UITextField!
    @IBOutlet var contentView:UIView!
    @IBOutlet var caculateButton:UIButton!
    @IBOutlet var bmiLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightField.addTarget(self, action: #selector(hideBMI(_:)), for: .editingDidBegin)
        weightField.addTarget(self, action: #selector(hideBMI(_:)), for: .editingDidBegin)
    }
    
    @IBAction func userClick(_ sender:UIButton){
        heightField.endEditing(true)
        weightField.endEditing(true)
        guard heigtLabel.text != "", weightField.text != "" else{
            let emptyAlert = UIAlertController(title: "錯誤", message: "欄位沒有填寫", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default)
            emptyAlert.addAction(okAction)
            self.present(emptyAlert, animated: true)
            return
        }
        let heightValue = Int(heightField.text!)
        let weightValue = Int(weightField.text!)
        
        if let heightValue = heightValue, let weightValue = weightValue{
            print("Hello!")
            print("heightValue:\(heightValue)")
            print("weightValue:\(weightValue)")
            let bmi = Double(weightValue) / pow(Double(heightValue)/100.0, 2)
            var message:String;
            switch bmi{
            case 0..<18.5:
                message = "體重過輕"
            case 18.5..<24:
                message = "正常範圍"
            case 24..<27:
                message = "體重"
            case 27..<30:
                message = "輕度肥胖"
            case 20..<35:
                message = "中度肥胖"
            default:
                message = "重度肥胖"
            }
            bmiLabel.isHidden = false
            bmiLabel.text = String(format: "BMI:%.2f\n%@", bmi,message)
           
        }
        
        
    }
    
    @objc func hideBMI(_ sender:Any){
        print("heightField begin Editing")
        bmiLabel.isHidden = true
    }


}

