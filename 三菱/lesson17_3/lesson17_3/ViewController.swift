//
//  ViewController.swift
//  lesson17_3
//
//  Created by 徐國堂 on 2023/10/19.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let width = self.view.viewWithTag(5)?.frame.width{
            print(width)
        }
    }


}

