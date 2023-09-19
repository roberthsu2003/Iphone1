//
//  ViewController.swift
//  手動建立button
//
//  Created by 徐國堂 on 2023/9/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        self.view.addSubview(button)
        button.addAction(UIAction(handler: { _ in
            print("您按了這個按鈕")
        }), for: .touchUpInside)
    }


}

