//
//  SearchViewController.swift
//  lesson23_FMDB
//
//  Created by 徐國堂 on 2021/8/2.
//

import UIKit
import FMDB

class SearchViewController: UITableViewController {
    
    lazy var targetURL:URL? = {
        let fileManager = FileManager.default
        guard var targetURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
            print("targetURL路徑取得錯誤")
            return nil
        }
        
        print(targetURL.path)
        targetURL.appendPathComponent("citys.db")
        return targetURL
    }()
    
    lazy var database:FMDatabase = {
        FMDatabase(url: self.targetURL)
    }()
    
    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = getAllCities()
        print(cities)
    }
    
    func getAllCities() -> [City]{
        database.open()
        guard let rs = try? database.executeQuery("SELECT cityName,country,url from city ", values: nil)else{
            return [City]()
        }
       var cities = [City]()
        while rs.next(){
            if let cityName = rs["cityName"] as? String,let country = rs["country"] as? String,let url = rs["url"] as? String {
                let city = City(cityName: cityName, url: url, country: country)
                cities.append(city)
            }
          
        }
        database.close()
        return cities
    }

    
}

extension SearchViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let city = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = city.cityName
        contentConfiguration.secondaryText = city.country
        cell.contentConfiguration = contentConfiguration
        return cell
    }
}

extension SearchViewController{
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let city = cities[indexPath.row]
        print(city.url)
    }
}
