//
//  ViewController.swift
//  lesson9_3
//
//  Created by 徐國堂 on 2023/4/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: UIButton.ButtonType.close)
        button.frame.origin.x = 100
        button.frame.origin.y = 50
        self.view.addSubview(button)
    }


}

