//
//  ViewController.swift
//  lesson6_1
//
//  Created by 徐國堂 on 2021/4/25.
//

import UIKit

class ViewController: UITableViewController {
    //awakeFromNib執行的時間點比viewDidLoad
    //這時間點不會使用到storyboard內的View
    
    var cities = [City]()
    var cityIsMarked:[Bool]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")!
        let allCity = NSArray(contentsOf: pathURL) as? [[String:Any]]
        for oneCity in allCity!{
            let cityName = oneCity["City"] as! String
            let continent = oneCity["Continent"] as! String
            let country = oneCity["Country"] as! String
            let image = oneCity["Image"] as! String
            let local = oneCity["Local"] as! String
            let latitude = oneCity["lat"] as! Double
            let longitude = oneCity["long"] as! Double
            let url = oneCity["url"] as! String
            let city = City(city: cityName, continent: continent, country: country, image: image, local: local, latitude: latitude, longitude: longitude, url: url)
            cities.append(city)
        }
        cityIsMarked = Array(repeating: false, count: cities.count)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "世界城市介紹"
        
    }
    
    //MARK: - UITbaleViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        //tableView會來執行這個method,尋問,tableView有多少個row
        return cities.count
    }
    
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //當畫面要出現的row範圍時,tableView會要求傳出所需要的UITableViewCell
        let rowIndex = indexPath.row
        let city = cities[rowIndex]
        let cityName = city.city
        let imageName = city.image
        let countryName = city.country
        let continentName = city.continent
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CITYCELL", for: indexPath) as! CityCell
        cell.cityLabel.text = cityName
        cell.cityImageView.image = UIImage(named: imageName!)
        cell.countryLabel.text = countryName
        cell.continentLabel.text = continentName
        
        if cityIsMarked[rowIndex]{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                     commit editingStyle: UITableViewCell.EditingStyle,
                     forRowAt indexPath: IndexPath){
        
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
      performSegue(withIdentifier: "goDetail", sender: nil)
    }

   @available(iOS 8, *)
    override func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        let deleteAction = UITableViewRowAction(style: .default, title: "刪除") { (action:UITableViewRowAction, indexPath:IndexPath) in
            if action.title == "刪除" {
                self.cities.remove(at: indexPath.row)
                self.cityIsMarked.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
        }
        
        deleteAction.backgroundColor = UIColor(red: 171/255, green: 227/255, blue: 255/255, alpha: 1)
        
        return [deleteAction]
    }
    
    @available(iOS 11,*)
    override func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let deleteAction = UIContextualAction(style: .destructive, title: "刪除") { (action:UIContextualAction, view:UIView, command:@escaping (Bool) -> Void )in
            self.cities.remove(at: indexPath.row)
            self.cityIsMarked.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = UIColor(red: 171/255, green: 227/255, blue: 255/255, alpha: 1)
        
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
   

    
    
}

