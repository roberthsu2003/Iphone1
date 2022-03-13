//
//  ViewController.swift
//  project15
//
//  Created by 徐國堂 on 2022/3/6.
//

import UIKit


class ViewController: UITableViewController {
    let cities = DataSource.singleton.cities
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ViewController{
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let city = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)

        cell.textLabel?.text = city.city
        return cell
        
    }
}

