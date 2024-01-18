//
//  CityDetailViewController.swift
//  2lesson11_2
//
//  Created by 徐國堂 on 2024/1/18.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    var city:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: city.image)
        let imageView = UIImageView(image: image)
        tableView.tableHeaderView = imageView
        
    }
    

    
}
