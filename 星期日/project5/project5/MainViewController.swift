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
        
        switch(bmi){
        case 0...18.5:
            print("體重過輕")
        case 18.5 ..< 24:
            print("標準")
        
        case 24..<27:
            print("過重")
            
        case 27..<30:
            print("輕度肥胖")
        
        case 30..<35:
            print("中度肥胖")
            
        default:
            print("重度肥胖")
            
        }
        
        BMITextField.text = String(format: "%.2f", bmi)
        
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
