//
//  ViewController.swift
//  4_0_1_plist解析
//
//  Created by 徐國堂 on 2023/12/1.
//

import UIKit

class ViewController: UIViewController {
    var cities:[[String:Any]]
    
    required init?(coder: NSCoder) {
        cities = DataSource.main?.cities ?? [[String:Any]]()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cities)
    }
   


}

