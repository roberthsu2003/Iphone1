//
//  ViewController.swift
//  lesson4
//
//  Created by 徐國堂 on 2024/11/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "Hello! ViewController"
        
    }
    
    @IBAction func buttonPress(_ sender:UIButton){
        myLabel.text = "Button pressed!"
    }


}

