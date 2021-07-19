//
//  ViewController.swift
//  lesson13_2
//
//  Created by 徐國堂 on 2021/7/7.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    var cities:[City]={
        if let plistURL = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            if let array = NSArray(contentsOf: plistURL) as? [[String:Any]]{
                var citys = [City]()
                for cityDic in array{
                    let city = City()
                    city.city = cityDic["City"] as? String
                    city.country = cityDic["Country"] as? String
                    city.continent = cityDic["Continent"] as? String
                    city.image = cityDic["Image"] as? String
                    city.local = cityDic["Local"] as? String
                    city.url = cityDic["url"] as? String
                    city.latitude = cityDic["lat"] as? Double
                    city.longitude = cityDic["long"] as? Double
                    citys.append(city)
                }
                return citys
            }
        }
        
        return [City]()
        
    }()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let city = sender as! City
        if segue.identifier == "goDetail"{
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.city = city
            
        }
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
       


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let indexRow = indexPath.row
        let city = cities[indexRow]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! MyCell
        /*
        cell.backgroundColor = UIColor.systemPink
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemTeal
        cell.selectedBackgroundView = backgroundView
         */
        cell.cityName.text = city.city
        cell.countryName.text = city.country
        cell.continent.text = city.continent
        if let imageName = city.image{
            cell.cityImageView.image = UIImage(named:imageName)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                     commit editingStyle: UITableViewCell.EditingStyle,
                     forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            let deleteRow = indexPath.row
            cities.remove(at: deleteRow)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
       
        
        
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let selectedIndex = indexPath.row
        let city = cities[selectedIndex]
        performSegue(withIdentifier: "goDetail", sender: city)
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let deletAction = UIContextualAction(style: .normal, title: "刪除") { (action, sourceView, completionHandler) in
            let deleteRow = indexPath.row
            self.cities.remove(at: deleteRow)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        
        
        deletAction.backgroundColor = UIColor.systemRed
        
        let insertAction = UIContextualAction(style: .normal, title: "新增") { (action:UIContextualAction, sourceView:UIView, completionHandler: (Bool) -> Void) in
            print("insertAction")
            completionHandler(true)
        }
        
        insertAction.backgroundColor = UIColor.systemGreen
        
        let config = UISwipeActionsConfiguration(actions: [deletAction,insertAction])
        return config
        
    }
    
}

