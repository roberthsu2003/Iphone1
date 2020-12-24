//
//  ViewController.swift
//  lesson7-1
//
//  Created by 徐國堂 on 2020/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = UIColor(red: 0.3, green: 0.2, blue: 0.6, alpha: 1)
        let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        view.addSubview(v1)
    }


}

