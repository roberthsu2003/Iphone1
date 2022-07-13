//
//  CityDetalViewController.swift
//  project11
//
//  Created by 徐國堂 on 2022/7/11.
//

import UIKit

class CityDetailViewController: UITableViewController {
    @IBOutlet var cityImageView:UIImageView!
    
    var city:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.city
        cityImageView.image = UIImage(named: city.image)
        
    }
}

extension CityDetailViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 4;
    }
    
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        if #available(iOS 15, *){
            var content = cell.defaultContentConfiguration()
            switch indexPath.row{
            case 0:
                content.text = city.city
            case 1:
                content.text = city.country
            case 3:
                content.text = city.continent
                print("continent\(city.continent)")
            case 4:
                content.text = city.url
                print("url\(city.url)")
            default:
                break
            }
            cell.contentConfiguration = content
        }else{
            switch indexPath.row{
            case 0:
                cell.textLabel?.text = city.city
            case 1:
                cell.textLabel?.text  = city.country
            case 3:
                cell.textLabel?.text  = city.continent
            case 4:
                cell.textLabel?.text  = city.url
            default:
                break
            }
        }
        
        return cell
       
    }
}
