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
        let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor.blue
        view.addSubview(v1)
    }


}

