//
//  ViewController.swift
//  lesson10_3
//
//  Created by 徐國堂 on 2025/4/2.
//

import UIKit

class ViewController: UITableViewController {
    
    var cities = [[String:Any]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")else{
            return
        }
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]] ?? []
        
        
    }

}

extension ViewController{
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }


    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row

        // Configure the cell’s contents.
        let city = cities[index]
        let cityName = city["City"] as? String ?? ""
        
        let countryName = city["Country"] as? String ?? ""
        let continentName = city["Continent"] as? String ?? ""
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTypeIdentifier", for: indexPath) as! CityCell
        cell.cityLabel.text = cityName
        cell.countryLabel.text = countryName
        cell.continentLabel.text = continentName
        cell.cityImageView.layer.cornerRadius = 30
        
        if let imageName = city["Image"] as? String{
            cell.cityImageView.image = UIImage(named: imageName)
        }else{
            cell.cityImageView = nil
        }
        
       
        cell.accessoryType = .disclosureIndicator
            
        
       
        
        
        
        
           
       return cell
    }
}

extension ViewController{
    //MARK: - UITableViewDelegate
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        
        
        self.performSegue(withIdentifier: "GO_DETAIL", sender: nil)
        
        
        
    }
    
    
    @available(iOS 8.0, *)
    override func tableView(
        _ tableView: UITableView,
        editActionsForRowAt indexPath: IndexPath
    ) -> [UITableViewRowAction]?{
        return nil
    }
    
    @available(iOS 11.0, *)
    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration?{
        let shareAction = UIContextualAction(style: .normal, title: "分享") {
            (action:UIContextualAction, view:UIView, completionHandler:@escaping (Bool) -> Void) in
            print("分享")
            completionHandler(true)
        }
        shareAction.backgroundColor = .systemGreen
        return UISwipeActionsConfiguration(actions: [shareAction])
    }
    
    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration?{
        let deleteAction = UIContextualAction(style: .normal, title: "刪除") {
            (action:UIContextualAction, view:UIView, completionHandler:@escaping (Bool) -> Void) in
            self.cities.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

