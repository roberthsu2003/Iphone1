//
//  CityOfCountryViewController.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/8/3.
//

import UIKit

class CityOfCountryViewController: UITableViewController {
    var country:String!
    var cities:[City]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = country
        cities = DataSource.singleton.getCities(withCountry: country)
        print(cities!)
    }
    

}

extension CityOfCountryViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let city = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        if #available(iOS 15, *){
            var content = cell.defaultContentConfiguration()
            content.text = city.city;
            content.secondaryText = city.country
            content.image = UIImage(named: city.image)
            content.imageProperties.reservedLayoutSize = CGSize(width: 80, height: 50)
            cell.contentConfiguration = content
        }else{
            cell.textLabel?.text = city.city
            cell.detailTextLabel?.text = city.country
            cell.imageView?.image = UIImage(named: city.image)
        }
        
        return cell;
    }
    
    
}

