//
//  ViewController.swift
//  DataSource
//
//  Created by t1 on 2019/2/17.
//  Copyright © 2019年 gjun. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allCitys:[City]!;
    let  searchController = UISearchController(searchResultsController: nil);
    
    override func awakeFromNib() {
        super.awakeFromNib();
        let dataSource = DataSource.singleton;
        allCitys = dataSource.allCitys;
        searchController.searchResultsUpdater = self;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = searchController.searchBar;
    
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return allCitys.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row;
        let city = allCitys[rowIndex];       
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CityCell;
        cell.cityLabel.text = city.city;
        cell.countryLabel.text = city.country;
        cell.continentLabel.text = city.continent;
        cell.cityImageView.image = UIImage(named: city.image);
        return cell;
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        return nil;
    }



}

extension ViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController){
        let searchBar = searchController.searchBar;
        if let searchString = searchBar.text , searchString != ""{
            allCitys = DataSource.singleton.selectedCity(name:searchString);
            print(allCitys.count);
        }else{
            allCitys = DataSource.singleton.allCitys;
            print(allCitys.count);
        }
        self.tableView.reloadData();
    }
}

