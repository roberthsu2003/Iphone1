//
//  ViewController.swift
//  lesson1_1
//
//  Created by 徐國堂 on 2021/3/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var messageLabel:UILabel!
    @IBOutlet var newButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray
        messageLabel.text = "Hello! Iphone"
        newButton.setTitle("press ME", for: .normal)
    }


}

