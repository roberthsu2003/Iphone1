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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func userOk(_ sender:UIBarButtonItem){
        print("ok")
    }
    
    @IBAction func userClear(_ sender:UIBarButtonItem){
        print("clear")
        heightTextField.text=""
        weightTextField.text = ""
        BMITextField.text = ""
    }
    

}
