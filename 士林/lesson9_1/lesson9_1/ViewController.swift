//
//  ViewController.swift
//  lesson9_1
//
//  Created by 徐國堂 on 2023/4/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var messageLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "swift,起步走"
        messageLabel.textColor = UIColor.red
        messageLabel.font = UIFont(name: "Helvetica-Light", size: 24)
    }


}

