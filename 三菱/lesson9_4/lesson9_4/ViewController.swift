//
//  ViewController.swift
//  lesson9_4
//
//  Created by 徐國堂 on 2023/8/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("storyboard內的所有view,已經可以存取了")
        print(view.frame)
        view.backgroundColor = .cyan
    }


}

