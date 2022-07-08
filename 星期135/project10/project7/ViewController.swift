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
    var cityIsMarked:[Bool]!
    
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
        cityIsMarked = Array(repeating: false, count: self.cities.count)
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
        if cityIsMarked[rowIndex]{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                     commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            //print("使用者要刪除\(cities[indexPath.row]["City"] as? String ?? "")")
            cities.remove(at: indexPath.row)
            cityIsMarked.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        //建立一個action sheet的選項按鈕
        let optionMenu = UIAlertController(title: nil, message: "您想要做什麼?", preferredStyle: .actionSheet)
        //建立action sheet內的按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //建立action sheet內的按鈕call-action
        let callAction = UIAlertAction(title: "聯絡旅行社", style: .default){ (action:UIAlertAction) -> Void in
            let alertMessageController = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert)
            alertMessageController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessageController, animated: true, completion: nil)
        }
        
        optionMenu.addAction(callAction)
        
        
        
        //建立accessoryType
        //取得目前cell的實體
        guard let currentCell = tableView.cellForRow(at: indexPath) else{
            return
        }
        //建立和取消checkmark
        //增加標示選項
        var titleName:String
        if cityIsMarked[indexPath.row]{
            titleName = "取消標示"
        }else{
            titleName = "標示"
        }
        
        let checkInMark = UIAlertAction(title: titleName, style: .default){
            (action:UIAlertAction) -> Void in
            switch titleName{
            case "取消標示":
                currentCell.accessoryType = .none
                self.cityIsMarked[indexPath.row] = false
            case "標示":
                currentCell.accessoryType = .checkmark
                self.cityIsMarked[indexPath.row] = true
            default:
                break;
            }
        }
       
        optionMenu.addAction(checkInMark)
        present(optionMenu, animated: true)
        
        
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
            self.cityIsMarked.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        shareAction.backgroundColor = UIColor(red: 48.0/255, green: 173.0/255, blue: 99.0/255, alpha: 1.0)
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255, green: 202.0/255, blue: 202.0/255, alpha: 1.0)
        return [shareAction,deleteAction]
    }
    


}

