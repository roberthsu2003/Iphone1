//
//  ViewController.swift
//  lesson14_2
//
//  Created by 徐國堂 on 2023/9/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = UIView(frame: CGRect(x: 100, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        self.view.addSubview(v1)
    }


}

