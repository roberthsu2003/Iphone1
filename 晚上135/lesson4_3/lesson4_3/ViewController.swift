//
//  ViewController.swift
//  lesson4_3
//
//  Created by 徐國堂 on 2021/6/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var messageView:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let families = UIFont.familyNames
        var message = ""
        for name in families{
            message += "\(name)\n"
        }
        
        messageView.text = message
    }


}

