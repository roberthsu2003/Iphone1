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
                    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "清除", style: .plain, target: self, action: #selector(userClear(_:)))
                    heightTextField.endEditing(true)
                    weightTextField.endEditing(true)
                
                default:
                    print("數值異常")
            }
            
        }else{
            let alertController = UIAlertController(title: "警告", message: "欄位有問題`", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default){
                (action:UIAlertAction) -> Void in
                self.heightTextField.text = ""
                self.weightTextField.text = ""
                self.heightTextField.endEditing(true)
                self.weightTextField.endEditing(true)
            }
            alertController.addAction(okAction)
            present(alertController, animated: true)
        }
        
        
    }
    
    @objc func userClear(_ sender:UIBarButtonItem){
        navigationItem.prompt = nil
        navigationItem.rightBarButtonItem = nil
        heightTextField.text = ""
        weightTextField.text = ""
    }
    

  

}
