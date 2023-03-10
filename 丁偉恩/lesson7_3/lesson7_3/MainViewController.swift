//
//  MainViewController.swift
//  lesson7_3
//
//  Created by 徐國堂 on 2023/3/10.
//

import UIKit

class MainViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
        v.backgroundColor = UIColor.systemBlue
        view.addSubview(v)
    }
}
