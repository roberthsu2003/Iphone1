//
//  CityDetailViewController.swift
//  project10
//
//  Created by 徐國堂 on 2022/2/13.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var cityImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    var city:City!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImageView.image = UIImage(named: city.image)
        
    }

}

extension CityDetailViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! DetailViewCell
        
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text = "城市"
            cell.valueLabel.text = city.city
        case 1:
            cell.fieldLabel.text = "國家"
            cell.valueLabel.text = city.country
        
        case 2:
            cell.fieldLabel.text = "洲"
            cell.valueLabel.text = city.continent
            
        case 3:
            cell.fieldLabel.text = "網址"
            cell.valueLabel.text = city.url
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
       
        return cell;
    }
    
    
}

extension CityDetailViewController:UITableViewDelegate{
    
}
