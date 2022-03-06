//
//  ViewController.swift
//  project15
//
//  Created by 徐國堂 on 2022/3/6.
//

import UIKit


class ViewController: UIViewController {
    
    override func awakeFromNib() {
        DataSource.copyFilesToDocuments()
        DataSource.createConn()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

