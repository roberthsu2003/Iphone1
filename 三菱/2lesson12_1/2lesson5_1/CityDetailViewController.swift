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
        tableView.delegate = self
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
        
        let rowIndex = indexPath.row
        switch rowIndex{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID1, for: indexPath) as! DetailCell
            cell.fieldName.text = "城市:"
            cell.fieldContent.text = city.city
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID1, for: indexPath) as! DetailCell
            cell.fieldName.text = "國家:"
            cell.fieldContent.text = city.country
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID1, for: indexPath) as! DetailCell
            cell.fieldName.text = "洲:"
            cell.fieldContent.text = city.continent
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID1, for: indexPath) as! DetailCell
            cell.fieldName.text = "說明:"
            cell.fieldContent.text = city.local
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            var cellConfiguration = cell.defaultContentConfiguration()
            cellConfiguration.text = "網站介紹"
            cellConfiguration.textProperties.font = UIFont.boldSystemFont(ofSize: 18)
            cellConfiguration.textProperties.color = .systemBlue
            cellConfiguration.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            cell.contentConfiguration = cellConfiguration
            
            cell.accessoryType = .disclosureIndicator
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            let titleLabel = UILabel()
            titleLabel.text = "地圖介紹"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
            titleLabel.textColor = .systemBlue
            titleLabel.sizeToFit()
            cell.contentView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                titleLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 20)
                
            ])
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
            return cell
        }
       
    }
}

extension CityDetailViewController:UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        willSelectRowAt indexPath: IndexPath
    ) -> IndexPath?{
        switch indexPath.row{
        case 0...3:
            return nil
        default:
            return indexPath
        }
    }
}


