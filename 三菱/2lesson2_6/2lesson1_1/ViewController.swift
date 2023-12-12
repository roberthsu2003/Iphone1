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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //加入
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //移除
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardDidShow(_ sender:Notification){
        print("鍵盤起")
    }
    
    @objc func keyboardWillBeHidden(_ sender:Notification){
        print("鍵盤落")
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

