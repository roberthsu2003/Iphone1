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
    
    @IBAction func userClick(_ sender:UIButton){
        messageLabel.text = "按鈕被按了"
    }
    
    @IBAction func userSwitch(_ sender:UISwitch){
        var switchState = ""
        if sender.isOn{
            switchState = "開啟狀態"
        }else{
            switchState = "關閉狀態"
        }
        messageLabel.text = "switch,被按了,\(switchState)"
    }


}

