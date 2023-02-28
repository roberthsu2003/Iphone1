//
//  ViewController.swift
//  lesson7_3
//
//  Created by 徐國堂 on 2023/2/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        v.backgroundColor = UIColor.red
        view.addSubview(v)
        
    }


}

