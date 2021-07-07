//
//  ViewController.swift
//  lesson13_2
//
//  Created by 徐國堂 on 2021/7/7.
//

import UIKit

class ViewController: UIViewController {
    var cities = [[String:Any]]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Bundle.main.url(forResource: "citylist", withExtension: "plist")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

