//
//  ViewController.swift
//  project7
//
//  Created by 徐國堂 on 2022/7/4.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
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
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        cityTableView.delegate = self
       
        
    }
    
    //MARK: - UITableViewDataSource
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
        cell.cityImageView.layer.cornerRadius = 40
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                     commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        /* 透過UIViewController的class 建立一頁
        let nextViewController = UIViewController()
        nextViewController.view.backgroundColor = UIColor.blue
        navigationController?.pushViewController(nextViewController, animated: true)
         */
        
        /* 透過自訂的xib 和 ViewController建立一頁*/
        let nextViewController  = NextViewController(nibName: "NextViewController", bundle: nil)
        navigationController?.pushViewController(nextViewController, animated: true)
         
    }
    
    @available(iOS 8.0, *)
    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        let shareAction = UITableViewRowAction(style: .default, title: "分享"){
            (action:UITableViewRowAction,indexPath:IndexPath) -> Void in
            print("share")
        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "刪除"){
            (action:UITableViewRowAction,indexPath:IndexPath) -> Void in
            self.cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        shareAction.backgroundColor = UIColor(red: 48.0/255, green: 173.0/255, blue: 99.0/255, alpha: 1.0)
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255, green: 202.0/255, blue: 202.0/255, alpha: 1.0)
        return [shareAction,deleteAction]
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let shareAction = UIContextualAction(style: .normal, title: "分享") { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
            print("分享")
            completionHandler(true)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "刪除") { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
            self.cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        shareAction.backgroundColor = UIColor(red: 48.0/255, green: 173.0/255, blue: 99.0/255, alpha: 1.0)
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255, green: 202.0/255, blue: 202.0/255, alpha: 1.0)
        
        return UISwipeActionsConfiguration(actions: [shareAction,deleteAction])
    }


}

