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
        return 5;
    }
    
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! DetailViewCell
        
        switch indexPath.row{
        case 0:
            cell.fieldLabel?.text = "城市"
            cell.valueLabel?.text = city.city
        case 1:
            cell.fieldLabel?.text = "國家"
            cell.valueLabel?.text = city.country
        case 2:
            cell.fieldLabel?.text = "洲"
            cell.valueLabel?.text = city.continent
        case 3:
            cell.fieldLabel?.text = "網址"
            cell.valueLabel?.text = city.url
            
        case 4:
            cell.fieldLabel?.text = "說明"
            cell.valueLabel?.text = city.local
        default:
            break
            
        }
        return cell
       
    }
}
