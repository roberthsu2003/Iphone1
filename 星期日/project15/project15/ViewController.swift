//
//  ViewController.swift
//  project15
//
//  Created by 徐國堂 on 2022/3/6.
//

import UIKit


class ViewController: UIViewController {
    let dataSource = DataSource.singleton
    
    override func awakeFromNib() {
        dataSource.getAllCityData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

