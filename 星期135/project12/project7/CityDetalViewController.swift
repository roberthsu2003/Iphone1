//
//  CityDetalViewController.swift
//  project11
//
//  Created by 徐國堂 on 2022/7/11.
//

import UIKit

class CityDetailViewController: UITableViewController {
    //@IBOutlet var imageView:UIImageView!
    
    var city:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.city
        //imageView.image = UIImage(named: city.image)
        
    }
    


}
