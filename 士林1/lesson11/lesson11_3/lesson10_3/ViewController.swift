//
//  ViewController.swift
//  lesson10_3
//
//  Created by 徐國堂 on 2025/4/2.
//

import UIKit

class ViewController: UITableViewController {
    
    var cities = [[String:Any]]()
    var cityInMarked = [Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")else{
            return
        }
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]] ?? []
        cityInMarked = Array(repeating: false, count: cities.count)
        
    }
    
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
        
        if cityInMarked[index]{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
       
        
        
        
        
           
       return cell
    }
    //MARK: - UITableViewDelegate
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        
        let optionMenu = UIAlertController(title: nil, message: "您想要做什麼？", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        optionMenu.addAction(cancelAction)
        /*
        let callAction = UIAlertAction(title: "聯絡旅行社", style: .default) { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert);
                        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
                        self.present(alertMessage, animated: true, completion: nil);
        }
         */
        /*
        let callAction = UIAlertAction(title: "聯絡旅行社", style: .default){
            (action:UIAlertAction) -> Void in
            let alertMessage = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert);
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            self.present(alertMessage, animated: true, completion: nil);
        }
         */
        let callAction = UIAlertAction(title: "聯絡旅行社", style: .default) { (action:UIAlertAction)->Void in
            let alertMessage = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert);
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            self.present(alertMessage, animated: true, completion: nil);
        }
        
        optionMenu.addAction(callAction)
        var titleName:String;
        if(cityInMarked[indexPath.row]){
            titleName = "取消標示"
        }else{
            titleName = "標示"
        }
        
        let checkInMark = UIAlertAction(title: titleName, style: .default) {
            (action:UIAlertAction)->Void in
            switch titleName{
            case "標示":
                self.cityInMarked[indexPath.row] = true
                let cell = tableView.cellForRow(at: indexPath)!
                cell.accessoryType = .checkmark
            default:
                self.cityInMarked[indexPath.row] = false
                let cell = tableView.cellForRow(at: indexPath)!
                cell.accessoryType = .none
            }
           
        }
        
        optionMenu.addAction(checkInMark)
        self.present(optionMenu, animated: true)
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
            self.cityInMarked.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    

}

