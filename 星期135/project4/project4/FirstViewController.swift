//
//  FirstViewController.swift
//  project4
//
//  Created by 徐國堂 on 2022/6/27.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var heightTextField:UITextField!
    @IBOutlet var weightTextField:UITextField!
    @IBOutlet var okButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okButton.addTarget(self, action: #selector(userClick(_:)), for:.touchUpInside)
       
    }
    
    @objc func userClick(_ sender:UIButton){
        /*
        if let height = Int(heightTextField.text!){
            print(height)
        }else{
            print("身高欄位資料有問題")
        }
        
        if let weight = Int(weightTextField.text!){
            print(weight)
        }else{
            print("體重欄位資料有問題")
        }*/
        
        if let height = Int(heightTextField.text!),let weight = Int(weightTextField.text!){
            print(height)
            print(weight)
            switch(height,weight){
                case (100...250,40...300):
                    let bmi = Double(weight) / ((Double(height)/100) * (Double(height)/100))
                    navigationItem.prompt = String(format: "%.2f", bmi)
                    heightTextField.endEditing(true)
                    weightTextField.endEditing(true)
                
                default:
                    print("數值異常")
            }
            
        }else{
            print("欄位有問題")
        }
        
        
    }
    

  

}
