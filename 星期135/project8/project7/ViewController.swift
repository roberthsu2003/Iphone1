//
//  ViewController.swift
//  project7
//
//  Created by 徐國堂 on 2022/7/4.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var cityTableView:UITableView!
    
    var cities = [[String:Any]]()
    
    override func awakeFromNib() {
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有發現檔案")
            return
        }
        guard let cities = (try? NSArray(contentsOf: pathURL, error: ())) as? [[String:Any]] else{
            print("轉換為NSArray有問題")
            return
        }
        /*
        guard let cities = citys as? [[String:Any]] else{
            print("NSArray轉換為Array有問題")
            return
        }*/
        self.cities = cities
        /*
        for city in cities{
            print(city)
        }
         */
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
       
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let rowIndex = indexPath.row
        let city = cities[rowIndex]
        let cityName = city["City"] as? String
        let imageName = city["Image"] as? String ?? ""
        let countryName = city["Country"] as? String
        let continentName = city["Continent"] as? String
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CityCell
        cell.cityLable.text = cityName
        cell.countryLabel.text = countryName
        cell.continentLabel.text = continentName
        cell.cityImageView.image = UIImage(named: imageName)
        
        return cell
    }
    


}

