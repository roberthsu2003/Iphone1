//
//  ViewController.swift
//  lesson8_2
//
//  Created by 徐國堂 on 2021/6/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mySwitch:UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //錯誤只可以取出
        //mySwitch.style = .checkbox
        switch mySwitch.style{
        case .automatic:
            print("自動")
        case .checkbox:
            print("checkbox")
        case .sliding:
            print("滑動")
        default:
            print("其它")
        }
        
        //mySwitch.preferredStyle = .checkbox
    }


}

