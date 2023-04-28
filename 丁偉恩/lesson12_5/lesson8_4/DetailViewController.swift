//
//  DetailViewController.swift
//  lesson11_4
//
//  Created by 徐國堂 on 2023/4/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    var city:City!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = city.city
        //cityImageView.image = UIImage(named: city.image)
        if let cityImageView = tableView.tableHeaderView as? UIImageView{
            cityImageView.image = UIImage(named: city.image)
        }
    }
    

    deinit{
        print("被消滅了")
    }
}
