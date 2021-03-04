//
//  ViewController.swift
//  lesson22-1
//
//  Created by 徐國堂 on 2021/3/2.
//

import UIKit

class ViewController: UITableViewController {
    var allCitys = DataSource.main.allCitys
    override func viewDidLoad() {
        super.viewDidLoad()
        //DataSource.copyFilesToDocuments()
        
    }


}

extension ViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return allCitys.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row
        let city = allCitys[rowIndex]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CityCell
        
        cell.cityLabel.text = city.city;
        cell.countryLabel.text = city.country
        cell.continentLabel.text = city.continent
        //cell.cityImageView.image = UIImage(named: city.image)
        return cell
    }
}

extension ViewController{
    //UITableViewDelegate
}

