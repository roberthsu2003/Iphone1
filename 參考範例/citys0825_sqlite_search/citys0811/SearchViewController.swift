//
//  SearchViewController.swift
//  citys0811
//
//  Created by Robert on 2019/8/18.
//  Copyright © 2019 ios1. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {

    var citys:[City] = {
        
        guard let citys = DataSource.main.citys else{
            return [City]();
        }
        return citys;
        
    }();
    
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = searchController.searchBar;
        searchController.searchResultsUpdater = self;
        searchController.obscuresBackgroundDuringPresentation = false;
    }
    
   

}

extension SearchViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return citys.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let city = citys[indexPath.row]
        cell.textLabel?.text = city.name;
        cell.imageView?.image = UIImage(named: city.image)
        return cell;
    }
    
    
}

extension SearchViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController){
        defer {
             tableView.reloadData();
        }
        
        let searchBar = searchController.searchBar;
        let searchText = searchBar.text!;
        guard searchText.count > 0 else{
            
            citys = DataSource.main.citys!;
            return;
        }
        
        guard let searchResultCitys = DataSource.main.searchCity(searchValue: searchText) else{
            citys = DataSource.main.citys!;
            return
        }
        
        citys = searchResultCitys
        
    }

}


