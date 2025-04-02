//
//  ViewController.swift
//  lesson10_3
//
//  Created by 徐國堂 on 2025/4/2.
//

import UIKit

class ViewController: UITableViewController {
    
    var cities = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")else{
            return
        }
        self.cities = NSArray(contentsOf: pathURL) as? [[String:Any]] ?? []
                
    }


}

