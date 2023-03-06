//
//  ViewController.swift
//  lesson8_3
//
//  Created by 徐國堂 on 2023/3/6.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "這是程式產生的文字"
    }


}

