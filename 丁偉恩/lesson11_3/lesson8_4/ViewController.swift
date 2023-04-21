//
//  ViewController.swift
//  lesson8_4
//
//  Created by 徐國堂 on 2023/3/15.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet var cityTableView:UITableView!
    var cities = [City]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有檔案")
            return
        }
        guard let nsArray = try? NSArray(contentsOf: url, error:())else{
            print("解析錯誤")
            return
        }
        if let cityItems = nsArray as? [[String:Any]]{
            for dic_city in cityItems{
                let city = dic_city["City"] as? String ?? ""
                let country = dic_city["Country"] as? String ?? ""
                let continent = dic_city["Continent"] as? String ?? ""
                let image = dic_city["Image"] as? String ?? ""
                let local = dic_city["Local"] as? String ?? ""
                let url = dic_city["url"] as? String ?? ""
                let latitude = dic_city["lat"] as? Double ?? 0.0
                let longitude = dic_city["long"] as? Double ?? 0.0
                let oneCity = City(city: city, continent: continent, country: country, image: image, local: local, latitude: latitude, longitude: longitude, url: url)
                cities.append(oneCity)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        cityTableView.delegate = self
    }
    
    

}

extension ViewController:UITableViewDataSource{
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        return cities.count
    }
    
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        let index = indexPath.row
        let city = cities[index]
        let cityName = city.city
        let countryName = city.country
        let imageName = city.image
        let continentName = city.continent
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CityCell
        
        cell.cityLabel.text = cityName
        cell.continentLabel.text = continentName
        cell.countryLabel.text = countryName
        cell.cityImageView.image = UIImage(named: imageName)
        cell.cityImageView.layer.cornerRadius = 30
        
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        let selectedCell = tableView.cellForRow(at: indexPath) as! CityCell
        var message = ""
        switch (selectedCell.accessoryType){
        case .checkmark:
                message="取消標示"
        default:
            message="標示選取"
        }
        let markController = UIAlertController(title: "標示", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction) -> Void in
            let selectedCell = tableView.cellForRow(at: indexPath) as! CityCell
            if message == "標示選取"{
                selectedCell.accessoryType = .checkmark
            }else{
                selectedCell.accessoryType = .none
            }
            
        })
        
        let cancelAction = UIAlertAction(title: "取消", style: .default)
        
        markController.addAction(okAction)
        markController.addAction(cancelAction)
        self.present(markController, animated: true)
    }
    
    @available(iOS 8.0, *)
    func tableView(
        _ tableView: UITableView,
        editActionsForRowAt indexPath: IndexPath
    ) -> [UITableViewRowAction]?{
        let shareAction = UITableViewRowAction(style: .default, title: "分享") { (action:UITableViewRowAction, indexPath:IndexPath) in
            print("分享")
        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "刪除") { (action:UITableViewRowAction, indexPath:IndexPath) in
            let index = indexPath.row
            self.cities.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        shareAction.backgroundColor = UIColor(red: 48.0/255, green: 173.0/255, blue: 99.0/255, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255, green: 202.0/255, blue: 202.0/255, alpha: 1.0)
        
        return [shareAction,deleteAction]
    }
    
    @available(iOS 11.0, *)
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration?{
        let shareAction = UIContextualAction(style: .normal, title: "分享") { (action:UIContextualAction, view:UIView,handler:(Bool)->Void ) in
            print("分享")
            handler(true)
        }
        
        let deleteAction = UIContextualAction(style: .normal, title: "刪除") { (action:UIContextualAction, view:UIView,handler:(Bool)->Void ) in
            let index = indexPath.row
            self.cities.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            handler(true)
        }
        shareAction.backgroundColor = UIColor(red: 48.0/255, green: 173.0/255, blue: 99.0/255, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255, green: 202.0/255, blue: 202.0/255, alpha: 1.0)
        
        return UISwipeActionsConfiguration(actions: [shareAction,deleteAction])
    }
    
    
}

