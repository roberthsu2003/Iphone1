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
        print("user click")
    }


}

