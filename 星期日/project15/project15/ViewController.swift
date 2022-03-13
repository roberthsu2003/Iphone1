//
//  ViewController.swift
//  project15
//
//  Created by 徐國堂 on 2022/3/6.
//

import UIKit


class ViewController: UIViewController {
    let cities = DataSource.singleton.cities
    
    override func awakeFromNib() {
        
        for city in cities{
            print(city.city)
            print(city.country)
            print("===============")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

