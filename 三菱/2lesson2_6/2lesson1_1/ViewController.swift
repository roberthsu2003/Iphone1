//
//  ViewController.swift
//  2lesson1_1
//
//  Created by 徐國堂 on 2023/12/7.
//

import UIKit

class ViewController: UIViewController {
    var activeField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //使用者按了return
        print("按了return")
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
        
    }
}

