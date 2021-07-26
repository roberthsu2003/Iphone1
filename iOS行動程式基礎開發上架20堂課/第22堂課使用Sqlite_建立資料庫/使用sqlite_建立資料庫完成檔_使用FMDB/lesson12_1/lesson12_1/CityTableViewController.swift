//
//  CityTableViewController.swift
//  lesson12_1
//
//  Created by 徐國堂 on 2021/6/6.
//

import UIKit
import FMDB

class CityTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var cities = [String]()
    
    func getAllCity() -> [String]?{
        let citysPath = Bundle.main.url(forResource: "citys", withExtension: "db")
        let db = FMDatabase(url: citysPath)
        db.open()
        guard let rs = try? db.executeQuery("SELECT cityName FROM city", values: nil) else{
            print("執行錯誤")
            return nil;
        }
        var citys = [String]()
        while rs.next(){
            if let countryName = rs["cityName"] as? String{
                citys.append(countryName)
            }
          
        }
        db.close()
        
        return citys
    }
    
    func searchResult(string:String) -> [String]?{
        let citysPath = Bundle.main.url(forResource: "citys", withExtension: "db")
        let db = FMDatabase(url: citysPath)
        db.open()
        guard let rs = try? db.executeQuery("SELECT cityName FROM city WHERE  cityName like '%\(string)%'", values: nil) else{
            print("執行錯誤")
            return nil;
        }
        var citys = [String]()
        while rs.next(){
            if let countryName = rs["cityName"] as? String{
                citys.append(countryName)
            }
          
        }
        db.close()
        
        return citys
    }
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cities = getAllCity()!
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView=searchController.searchBar
    }

    

    

   

}

extension CityTableViewController{
    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let cityName = cities[indexPath.row]
        cell.textLabel?.text = cityName
        return cell
    }
}

extension CityTableViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController){
        let searchBar = searchController.searchBar
        if let searchString = searchBar.text, searchString != ""{
            //使用者在搜尋
            //print("開始搜尋\(searchString)")
            cities = searchResult(string: searchString)!
        }else{
            //沒有搜尋或搜尋的字串是空的
            cities = getAllCity()!
        }
        self.tableView.reloadData()
    }
}
