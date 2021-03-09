//
//  ViewController.swift
//  lesson22-1
//
//  Created by 徐國堂 on 2021/3/2.
//

import UIKit

class ViewController: UITableViewController {
    var allCitys = DataSource.main.allCitys
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DataSource.copyFilesToDocuments()
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
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
        cell.cityImageView.image = UIImage(named: city.image)
        return cell
    }
}

extension ViewController{
    //UITableViewDelegate
}

extension ViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController){
        let searchBar = searchController.searchBar
        if let searchString = searchBar.text, searchString != ""{
         allCitys = DataSource.main.selectedCity(name: searchString)
            
        }else{
            allCitys = DataSource.main.allCitys
            print("還沒開始搜尋")
        }
        tableView.reloadData()
    }
}

