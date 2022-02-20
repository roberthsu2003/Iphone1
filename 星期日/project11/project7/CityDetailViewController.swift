//
//  CityDetailViewController.swift
//  project10
//
//  Created by 徐國堂 on 2022/2/13.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var cityImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    var city:City!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImageView.image = UIImage(named: city.image)
        
    }
    

    

}
