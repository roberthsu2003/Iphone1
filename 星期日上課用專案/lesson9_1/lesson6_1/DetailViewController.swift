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
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL1", for: indexPath) as! DetailViewCell
        
        switch indexPath.row{
            case 0:
                cell.fieldLable.text = "城市"
                cell.valueLable.text = city.city
            case 1:
                cell.fieldLable.text = "國家"
                cell.valueLable.text = city.country
            case 2:
                cell.fieldLable.text = "洲"
                cell.valueLable.text = city.continent
            case 3:
                cell.fieldLable.text = "網址"
                cell.valueLable.text = city.url
            default:
                cell.fieldLable.text = ""
                cell.valueLable.text = ""
        }
        
        return cell
    }

   

}
