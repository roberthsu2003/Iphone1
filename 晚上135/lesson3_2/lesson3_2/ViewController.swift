//
//  ViewController.swift
//  lesson3_2
//
//  Created by 徐國堂 on 2021/6/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 150/255.0, green: 191/255.0, blue: 119/255.0, alpha: 1)
        
        let myView = UIView(frame: CGRect(x: 20, y: 50, width: 100, height: 100))
        myView.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1)
        
        view.addSubview(myView)
        
    }


}

