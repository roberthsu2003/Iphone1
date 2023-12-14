//
//  ViewController.swift
//  2lesson1_1
//
//  Created by 徐國堂 on 2023/12/7.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scrollView:UIScrollView!
    var activeField:UITextField!
    @IBOutlet var nameField:UITextField!
    @IBOutlet var addressField:UITextField!
    @IBOutlet var phoneField:UITextField!
    @IBOutlet var emailField:UITextField!
    @IBOutlet var passwordField:UITextField!
    @IBOutlet var confirmField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
            .userDomainMask, true)
        let documentsPath = paths.first!
        print(documentsPath)
        let userdefaults = UserDefaults.standard
        if let name = userdefaults.string(forKey: "name"){
            nameField.text = name
        }
        if let address = userdefaults.string(forKey: "address"){
            addressField.text = address
        }
        
        if let phone = userdefaults.string(forKey: "phone"){
            phoneField.text = phone
        }
        
        if let email = userdefaults.string(forKey: "email"){
            emailField.text = email
        }
        
        if let password = userdefaults.string(forKey: "password"){
            passwordField.text = password
        }
        
        if let confirm = userdefaults.string(forKey: "confirm"){
            confirmField.text = confirm
        }
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
    
    @IBAction func userClick(_ sender:UIButton){
        let name = nameField.text
        let address = addressField.text
        let phone = phoneField.text
        let email = emailField.text
        let password = passwordField.text
        let confirm = confirmField.text
        let userdefaults = UserDefaults.standard
        userdefaults.setValue(name, forKey: "name")
        userdefaults.setValue(address, forKey: "address")
        userdefaults.setValue(phone, forKey: "phone")
        userdefaults.setValue(email, forKey: "email")
        userdefaults.setValue(password, forKey: "password")
        userdefaults.setValue(confirm, forKey: "confirm")
        if userdefaults.synchronize(){
            print("存檔成功")
        }
        
    }
    
    @objc func keyboardDidShow(_ sender:Notification){
        if let keyboardSise = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            let keyboardHeight = keyboardSise.height
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets        
            
        }
    }
    
    @objc func keyboardWillBeHidden(_ sender:Notification){
        print("鍵盤落")
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
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

