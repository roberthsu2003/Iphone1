//
//  ViewController.swift
//  2lesson19_2
//
//  Created by 徐國堂 on 2024/2/27.
//

import UIKit
class MyCell:UITableViewCell{
    
}

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    
    var cities = [City]()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if let cities = DataSource.main.getCities(){
            self.cities = cities
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.cities)
    }


}

