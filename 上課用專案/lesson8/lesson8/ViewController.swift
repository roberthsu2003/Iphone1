//
//  ViewController.swift
//  lesson8
//
//  Created by 徐國堂 on 2020/12/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var centerButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerButton.setTitle("請按中心按鈕", for: UIControl.State.normal)
    }


}

