//
//  ViewController.swift
//  lesson10_5
//
//  Created by 徐國堂 on 2023/8/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor{
            (tc:UITraitCollection) -> UIColor in
            return UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
          }
        view.addSubview(v1)
    }


}

