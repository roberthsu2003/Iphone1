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
    var cityIsMarked:[Bool]!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //只執行一次,可以利用這個特性,在這裏做,所有storeProperty初始化
        //tableView.dataSource = self //storyboard 已經預設好了
        
        cityIsMarked = Array(repeating: false, count: cities.count)
        
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
        
        //加入accessoryView
        if cityIsMarked[indexPath.row] {
            cityCell.accessoryType = .checkmark
        }else{
            cityCell.accessoryType = .none
        }
        return cityCell
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let optionMenu = UIAlertController(title:nil, message: "您想要做什麼?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        let callAction = UIAlertAction(title: "聯絡旅行示", style:.default)
        {(action:UIAlertAction) in  //closure,呼叫ViewController 的 property 和 method必需使用self
            let alertMessage = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        optionMenu.addAction(callAction)
        
        var titleName:String
        if self.cityIsMarked[indexPath.row]{
            titleName = "取消標示"
        }else{
            titleName = "標示"
        }
        
        
        let checkInMark = UIAlertAction(title: titleName, style: .default)
        { (action:UIAlertAction)in
            let cell = tableView.cellForRow(at: indexPath)
            
            switch titleName{
            case "取消標示":
                cell!.accessoryType = .none
                self.cityIsMarked[indexPath.row] = false
            case "標示":
                cell!.accessoryType = .checkmark
                self.cityIsMarked[indexPath.row] = true
                
            default:
                break;
            }
        }
        
        optionMenu.addAction(checkInMark)
        
        present(optionMenu, animated: true, completion: nil)
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
            self.cityIsMarked.remove(at: indexPath.row)
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
            self.cityIsMarked.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [shareAction,deleteAction]
        
    }
    
    
    
    
    

}

