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
    
    var cities:[[String:Any]]!
    var cityIsMarked:[Bool]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")!
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]]
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
        let cityName = city["City"] as? String
        let imageName = city["Image"] as! String
        let countryName = city["Country"] as! String
        let continentName = city["Continent"] as! String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CITYCELL", for: indexPath) as! CityCell
        cell.cityLabel.text = cityName
        cell.cityImageView.image = UIImage(named: imageName)
        cell.countryLabel.text = countryName
        cell.continentLabel.text = continentName
        
        if cityIsMarked[rowIndex]{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        /*
        print("使用者點選了\(indexPath.row)")
        let index = indexPath.row
        let city = cities[index]
        let cityName = city["City"] as! String
        print(cityName)
 */
        
        let optionMenu = UIAlertController(title: nil, message: "您想要做什麼?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style:.cancel)
        
        optionMenu.addAction(cancelAction)
        
        
        
        let callAction = UIAlertAction(title: "聯絡旅行社", style: .default){(action:UIAlertAction) -> Void in
            let alertMessage = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction.init(title: "OK", style: .default))
            self.present(alertMessage, animated: true)
        }
        
        optionMenu.addAction(callAction)
        var titleName:String!;
        if self.cityIsMarked[indexPath.row]{
            titleName = "取消標示"
        }else{
            titleName = "標示"
        }
        
        
        let checkInMark = UIAlertAction(title: titleName, style: .default, handler: { (action:UIAlertAction) -> Void in
            
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
            
        })
        
        optionMenu.addAction(checkInMark)
        
        present(optionMenu, animated: true, completion: nil)
    }

}

