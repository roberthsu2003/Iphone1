//
//  FormViewController.swift
//  lesson14
//
//  Created by 徐國堂 on 2022/3/6.
//

import UIKit

class FormViewController: UITableViewController {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var passwordField:UITextField!
    
    var titleName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleName
    }
    
    @IBAction func userBack(_ sender:UIBarButtonItem){
        var message:String?
        switch (nameField.text, passwordField.text){
        case ("",""):
            message = "姓名和密碼欄不可以是空的"
        case (_, ""):
            message = "密碼不可以是空的"
        case ("",_):
            message = "姓名不可以是空的"
        default:
            navigationController?.popViewController(animated: true)
        }
        
        if let message = message{
            let alertController = UIAlertController(title: "警告", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        
        
    }

    
}
