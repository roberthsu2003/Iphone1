//
//  ViewController.swift
//  lesson4_2
//
//  Created by 徐國堂 on 2025/2/12.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var count1:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let desc = count1?.description{
            print("執行成功")
        }
    }


}

