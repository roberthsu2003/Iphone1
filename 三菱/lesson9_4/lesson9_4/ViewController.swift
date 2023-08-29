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
        
        let v2 = UIView(frame: CGRect(x: 41, y: 56, width: 132, height: 194))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        
        v1.addSubview(v2)
        v1.clipsToBounds = true
        
        let w1 = UIView(frame: CGRect(x: 43, y: 197, width: 160, height: 230))
        w1.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        view.addSubview(w1)
        
        
    }


}

