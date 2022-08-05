//
//  CityTableViewController.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/8/1.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    var cities:[City]!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func awakeFromNib() {
        if let c = DataSource.singleton.getCities(){
            self.cities = c
        }
        
        searchController.searchResultsUpdater = self;
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = searchController.searchBar
        
    }
       
   
}

extension CityTableViewController{
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

extension CityTableViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController){
        let searchBar = searchController.searchBar
        if let searchString = searchBar.text, searchString != ""{
            //searchBar.text不是空字串
            print(searchString)
        }else{
            //searchBar.text是空字串
        }
    }
}

