//
//  ViewController.swift
//  lesson7-ios14
//
//  Created by 徐國堂 on 2020/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v = UIView(frame:CGRect(x:100, y:100, width:50, height:50))
            v.backgroundColor = .red // 紅色的矩形
            self.view.addSubview(v) // 加入到view內成為view的subView
    }


}

