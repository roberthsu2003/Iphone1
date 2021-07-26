//
//  RegisteViewController.swift
//  lesson21
//
//  Created by 徐國堂 on 2021/7/26.
//

import UIKit

class RegisteViewController: UITableViewController {
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var ageTextField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func userRegister(_ sender:UIBarButtonItem){
        if nameTextField.text != "" && ageTextField.text != ""{
            let userDefault = UserDefaults.standard
            userDefault.setValue(nameTextField.text, forKey: "name")
            userDefault.setValue(Int(ageTextField.text!), forKey: "age")
            dismiss(animated: true, completion: nil)
        }else{
            //UIAlertViewController
        }
    }

  
}
