//
//  ViewController.swift
//  6_5citydb
//
//  Created by 徐國堂 on 2024/2/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let citys = DataSource.main.getCitys() else{
            return
        }
        for city in citys{
            print(city.name)
        }
    }


}

