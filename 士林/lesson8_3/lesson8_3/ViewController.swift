//
//  ViewController.swift
//  lesson8_3
//
//  Created by 徐國堂 on 2023/3/6.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLabel:UILabel!
    @IBOutlet var button1:UIButton!
    @IBOutlet var button2:UIButton!
    @IBOutlet var button3:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "這是程式控制的文字"
        myLabel.textAlignment = NSTextAlignment.center
    }


}

