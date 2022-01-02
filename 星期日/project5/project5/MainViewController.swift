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
        switch (heightValue,weightValue){
            
        case (50...250,20...300):
            print("正常範圍")
            let bmi = Double(weightValue) / pow(Double(heightValue) / 100.0, 2.0)
            print(bmi)
        default:
            print("不正常範圍")
            
        }
        
        
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
