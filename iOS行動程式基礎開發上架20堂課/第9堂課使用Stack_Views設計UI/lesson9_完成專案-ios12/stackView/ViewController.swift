//
//  ViewController.swift
//  stackView
//
//  Created by t1 on 2019/1/13.
//  Copyright © 2019年 gjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var titleLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func leffButtonPress(_ sender:UIButton){
        titleLabel.text = "press Left Button"
    }
    
    @IBAction func rightButtonPress(_ sender:UIButton){
        titleLabel.text = "press Right Button"
    }


}

