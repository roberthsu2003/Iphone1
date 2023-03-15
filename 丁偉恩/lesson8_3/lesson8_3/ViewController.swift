//
//  ViewController.swift
//  lesson8_3
//
//  Created by 徐國堂 on 2023/3/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myButton:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        myButton.addTarget(self, action: #selector(userClick(_:)), for: UIControl.Event.touchUpInside)
         */
        
    }
    /*
    @objc func userClick(_ sender:UIButton){
        print(sender)
        print(sender.titleLabel!.text!)
        print("USER Click")
    }
     */
    
    @IBAction func userClick(_ sender:UIButton){
        print(sender)
        print(sender.titleLabel!.text!)
        print("USER Click")
    }


}

