//
//  MainViewController.swift
//  project5
//
//  Created by 徐國堂 on 2022/1/2.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var heightTextField:UITextField!
    @IBOutlet var weightTextField:UITextField!
    @IBOutlet var BMITextField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //BMITextField.isEnabled = false
        
        
    }
    
    @IBAction func userOk(_ sender:UIBarButtonItem){
        let heightStirng = heightTextField.text!
        let weightStirng = weightTextField.text!
        let bmiStirng = BMITextField.text!
        
        
        //檢查使用者可以轉為整數
        guard let heightValue = Int(heightStirng),let weightValue = Int(weightStirng) else{
            print("有錯誤")
            return
        }
        
        //數值範圍
        var bmi = 0.0
        switch (heightValue,weightValue){
        case (50...250,20...300):
            //print("正常範圍")
            bmi = Double(weightValue) / pow(Double(heightValue) / 100.0, 2.0)
            
        default:
            print("輸入的值不在正常範圍")
            return
        }
        
        var suggest = ""
        
        switch(bmi){
        case 0...18.5:
            suggest = "體重過輕"
        case 18.5 ..< 24:
            suggest = "標準"
        
        case 24..<27:
            suggest = "過重"
            
        case 27..<30:
            suggest = "輕度肥胖"
        
        case 30..<35:
            suggest = "中度肥胖"
            
        default:
            suggest = "重度肥胖"
            
        }
        
        suggest = String(format: "%.2f", bmi) + "-\(suggest)"
        BMITextField.text = suggest
        /*
        BMITextField.attributedPlaceholder = NSAttributedString(string: suggest, attributes: [
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.darkGray
        ])
         */
        
    }
    
    @IBAction func userClear(_ sender:UIBarButtonItem){
        print("clear")
        heightTextField.text=""
        heightTextField.resignFirstResponder()
        
        weightTextField.text = ""
        weightTextField.resignFirstResponder()
        
        BMITextField.text = ""
        BMITextField.resignFirstResponder()
    }
    

}
