//
//  MyViewController.swift
//  lesson9-1
//
//  Created by 徐國堂 on 2020/12/29.
//

import UIKit

class MyViewController: UIViewController {
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var leftButton:UIButton!
    @IBOutlet var rightButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //再多做一些自已要做的功能事
        leftButton.addTarget(self, action: #selector(leftClick(_:)), for: .touchUpInside)
        
        rightButton.addTarget(self, action: #selector(rightClick(_:)), for: .touchUpInside)
    }
    
    @objc func leftClick(_ sender:UIButton){
        titleLabel.text = "Left Button Click"
    }
    
    @objc func rightClick(_ sender:UIButton){
        titleLabel.text = "Right Button Click"
    }
  
 
}
