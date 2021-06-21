//
//  ViewController.swift
//  lesson6_4
//
//  Created by 徐國堂 on 2021/6/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var heightTextField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userClick(_ sender:UIButton){
        print(heightTextField.text ?? "沒有值")
    }


}

