//
//  DetailViewController.swift
//  lesson11_4
//
//  Created by 徐國堂 on 2023/4/21.
//

import UIKit

class DetailViewController: UIViewController {
    var city:City!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(city.city)
    }
    

    deinit{
        print("被消滅了")
    }
}
