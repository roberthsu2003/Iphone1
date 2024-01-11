//
//  CityDetialViewController.swift
//  4_1_tableView
//
//  Created by 徐國堂 on 2024/1/11.
//

import UIKit

class CityDetialViewController: UIViewController {
    var city:City!
    @IBOutlet var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = UIImageView(image: UIImage(named: city.image))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }

}

extension CityDetialViewController:UITableViewDataSource{
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
            cell.fieldName.text = "城市:"
            cell.fieldContent.text = city.city
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
            cell.fieldName.text = "國家:"
            cell.fieldContent.text = city.country
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
            cell.fieldName.text = "洲:"
            cell.fieldContent.text = city.continent
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
            cell.fieldName.text = "洲:"
            cell.fieldContent.text = city.description
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
            var cellConfiguration = cell?.defaultContentConfiguration()
            cellConfiguration?.text = "網站介紹"
            cellConfiguration?.textProperties.font = .boldSystemFont(ofSize: 18)
            cellConfiguration?.textProperties.color = .blue
            cell?.contentConfiguration = cellConfiguration
            cell?.accessoryType = .disclosureIndicator
            return cell!
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
            var cellConfiguration = cell?.defaultContentConfiguration()
            cellConfiguration?.text = "地圖"
            cellConfiguration?.textProperties.font = .boldSystemFont(ofSize: 18)
            cellConfiguration?.textProperties.color = .blue
            cell?.contentConfiguration = cellConfiguration
            cell?.accessoryType = .disclosureIndicator
            return cell!
        default:
            break
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
        return cell!
    }
    
}

extension CityDetialViewController:UITableViewDelegate{
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
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        let rowIndex = indexPath.row
        switch rowIndex{
        case 4:
            print("網站")
        case 5:
            print("地圖")
        default:
            break
        }
    }
}
