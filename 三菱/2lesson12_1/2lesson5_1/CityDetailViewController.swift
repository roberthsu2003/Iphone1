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
    let cellID = "defaultCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: city.image)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        tableView.tableHeaderView = imageView
        var headerFrame = tableView.tableHeaderView?.frame
        headerFrame?.size.height = 250
        tableView.tableHeaderView?.frame = headerFrame!
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
    }

    
}

extension CityDetailViewController:UITableViewDataSource{
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        
    }
}


