//
//  ViewController.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/7/27.
//

import UIKit

class ViewController: UITableViewController {
    var continents:[String]!
    
    override func awakeFromNib() {
        continents = DataSource.singleton.getContinents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(continents!)
    }


}

