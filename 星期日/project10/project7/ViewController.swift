//
//  ViewController.swift
//  project7
//
//  Created by 徐國堂 on 2022/1/16.
//

import UIKit

class ViewController: UITableViewController {
    var cities:[[String:Any]]! = {
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            return nil
        }
        
        if #available(iOS 11.0, *){
            guard let city = try! NSArray(contentsOf: pathURL, error: ()) as? [[String:Any]] else{
                return nil
            }
            return city
            
        }else{
            
            guard let city = NSArray(contentsOf: pathURL) as? [[String:Any]] else{
                return nil
            }
            return city
            
        }
        
    }()
   
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //只執行一次,可以利用這個特性,在這裏做,所有storeProperty初始化
        //tableView.dataSource = self //storyboard 已經預設好了
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                 sender: Any?){
               
        if segue.identifier == "goDetail"{
            let cityName = sender as? String
            let detailViewController = segue.destination as! CityDetailViewController
            detailViewController.imageName = cityName
        }
        
        
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let city = cities[indexPath.row]
        let cityCell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CityCell
        cityCell.cityLabel.text = city["City"] as? String
        cityCell.countryLabel.text = city["Country"] as? String
        cityCell.continentLabel.text = city["Continent"] as? String
        cityCell.cityImageView.image = UIImage(named: city["Image"] as! String)
        cityCell.cityImageView.layer.cornerRadius = 40.0;
        
       
        
        return cityCell
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let selectedIndex = indexPath.row
        let selectedCity = cities[selectedIndex]
        if let cityName = selectedCity["Image"] as? String{
            performSegue(withIdentifier: "goDetail", sender: cityName)
            
        }
        
        
    }
    
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let shareAction = UIContextualAction(style:.normal, title: "分享") { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
            print("分享")
            completionHandler(true)
            
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "刪除") { (action:UIContextualAction, view:UIView,  completionHandler:(Bool) -> Void) in
            print("移除")
            //先刪資料，再刪row
            self.cities.remove(at: indexPath.row)
           
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        shareAction.backgroundColor = UIColor(red: 48.0/255, green: 173.0/255, blue: 99.0/255, alpha: 1.0)
        return UISwipeActionsConfiguration(actions: [shareAction,deleteAction])
    }
    
    @available(iOS 8.0, *)
    override func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        let shareAction = UITableViewRowAction(style: .normal, title: "分享") { (action:UITableViewRowAction, index:IndexPath) in
            print("分享")
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "刪除") { (action:UITableViewRowAction, index:IndexPath) in
            self.cities.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [shareAction,deleteAction]
        
    }
    
    
    
    
    

}

