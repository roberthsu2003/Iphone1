//
//  ViewController.swift
//  test1
//
//  Created by 徐國堂 on 2023/9/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var heightField:UITextField!
    @IBOutlet var weightField:UITextField!
    @IBOutlet var caculateButton:UIButton!
    @IBOutlet var containerStackView:UIStackView!
    
    //動態產生
    var bmiLabel=UILabel()
    var labelConstraints = [NSLayoutConstraint]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定label constraints
        bmiLabel.numberOfLines=2
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        labelConstraints.append(bmiLabel.topAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: 30))
        labelConstraints.append(bmiLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30))
        
        //欄位要編輯 editingDidBegin
        
        heightField.addTarget(self, action: #selector(hideBMI(_:)), for: .editingDidBegin)
        weightField.addTarget(self, action: #selector(hideBMI(_:)), for: .editingDidBegin)
        caculateButton.addAction(UIAction(handler: { [self] _ in
            //強迫停止編輯
            heightField.endEditing(true)
            weightField.endEditing(true)
            //檢查是否有欄位沒有填入
            guard heightField.text != "", weightField.text != "" else{
                let emptyAlert = UIAlertController(title: "錯誤", message: "欄位沒有填寫", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .default)
                emptyAlert.addAction(okAction)
                self.present(emptyAlert, animated: true)
                return
            }
            let heightValue = Int(heightField.text!)
            let weightValue = Int(weightField.text!)
            
            //檢查是否都有填入值和計算
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
                //bmiLabel.isHidden = false
                message = String(format: "BMI:%.2f\n%@", bmi,message)
                displayBMI(message: message)
               }
            
        }), for: .touchUpInside)
        
        
        
    }
    
   
    
    @objc func hideBMI(_ sender:Any){
        bmiLabel.removeFromSuperview()
        NSLayoutConstraint.deactivate(labelConstraints)
    }
    
    
    func displayBMI(message:String){
        view.addSubview(bmiLabel)
        bmiLabel.text = message
        NSLayoutConstraint.activate(labelConstraints)
    }
    


}

