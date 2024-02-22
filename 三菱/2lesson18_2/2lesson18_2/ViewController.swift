//
//  ViewController.swift
//  2lesson18_2
//
//  Created by 徐國堂 on 2024/2/22.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource = DataSource.main
        dataSource.delegate = self
        
    }


}

