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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        if let heightValue = heightValue, let weightValue = weightValue{
            print(heightValue)
            print(weightValue)
        }
        
        
    }


}

