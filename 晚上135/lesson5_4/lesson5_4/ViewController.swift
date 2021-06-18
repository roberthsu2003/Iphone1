//
//  ViewController.swift
//  lesson5_4
//
//  Created by 徐國堂 on 2021/6/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLabel:UILabel!
    @IBOutlet var myButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "Hello! Label"
        myButton.setTitle("請按我", for: .normal)
    }
    
    @IBAction func userClick(_ sender:UIButton){
        print("Hello!World!")
    }


}

