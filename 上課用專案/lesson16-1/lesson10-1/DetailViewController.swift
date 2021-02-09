//
//  DetailViewController.swift
//  lesson15-2
//
//  Created by 徐國堂 on 2021/2/4.
//

import UIKit

class DetailViewController: UITableViewController {
    var city:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.city
        let headView = tableView.tableHeaderView as! UIImageView
        headView.image = UIImage(named: city.image ?? "")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false;
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
