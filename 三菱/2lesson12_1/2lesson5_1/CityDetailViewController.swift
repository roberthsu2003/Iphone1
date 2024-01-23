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
    let cellID1 = "DetailCell"
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
        return 6
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let rowIndex = indexPath.row
        switch rowIndex{
        case 0:
            return cell
        case 1:
            return cell
        case 2:
            return cell
        case 3:
            return cell
        case 4:
            return cell
        case 5:
            return cell
        default:
            return cell
        }
       
    }
}


