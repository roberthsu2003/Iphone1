//
//  ViewController.swift
//  lesson8_2
//
//  Created by 徐國堂 on 2023/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view的實體已經建立完成")
        /*
        if let color = view.backgroundColor{
            print(color)
        }
        view.backgroundColor = UIColor.systemBlue
         */
        let myView = UIView(frame: CGRect.zero)
        myView.backgroundColor = UIColor.clear
        view = myView
    }


}

