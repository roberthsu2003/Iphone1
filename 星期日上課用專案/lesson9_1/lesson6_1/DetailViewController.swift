//
//  DetailViewController.swift
//  lesson9_1
//
//  Created by 徐國堂 on 2021/5/16.
//

import UIKit

class DetailViewController: UITableViewController {
    var city:City!
    @IBOutlet var cityImageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageName = city.image
        cityImageView.image = UIImage(named: imageName!)
    }

   

}
