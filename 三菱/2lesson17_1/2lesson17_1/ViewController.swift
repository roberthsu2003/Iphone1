//
//  ViewController.swift
//  2lesson17_1
//
//  Created by 徐國堂 on 2024/2/20.
//

import UIKit

class ViewController: UIViewController {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        DataSource.startDownLoad()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

