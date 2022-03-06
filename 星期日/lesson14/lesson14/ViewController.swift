//
//  ViewController.swift
//  lesson14
//
//  Created by 徐國堂 on 2022/3/6.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet var titleTextField:UITextField!
    @IBOutlet var nameField:UITextField!
    @IBOutlet var passwordField:UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userClick(_ sender:UIButton){
        if titleTextField.text != ""{
            performSegue(withIdentifier: "goForm", sender: nil)
        }else{
            let alertController = UIAlertController(title: "警告", message: "標題必需有資料", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        
    }


}

