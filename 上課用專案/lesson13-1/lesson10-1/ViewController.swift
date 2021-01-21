//
//  ViewController.swift
//  lesson10-1
//
//  Created by 徐國堂 on 2021/1/5.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cityTableView:UITableView!
    //要依據plist的架構來設定cities的資料類型
    //如果使用type!,代表暫時是nil,第一下就有值
    var cities:[[String:Any]]!
    var cityIsMarked:[Bool]!
    
   
    override func loadView() {
        super.loadView();
        let bundle = Bundle.main
        guard let pathUrl = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("程式出錯了")
            return
        }
        
        let tempArray = NSArray(contentsOf: pathUrl)
        cities = tempArray as? [[String:Any]]
        cityIsMarked = Array(repeating: false, count: cities.count)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        cityTableView.delegate = self
    }
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row
        let city = cities[rowIndex]
        var cell:CityCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "MYCELL", for: indexPath) as? CityCell
       
        //image
        let imageName = city["Image"] as! String
        cell.cityImageView.image = UIImage(named: imageName)
        cell.cityImageView.layer.cornerRadius = 40.0
        //cell.cityImageView.layer.masksToBounds = true;
        
        //cityname
        
        cell.cityLabel.text = city["City"] as? String
        cell.countryLabel.text = city["Country"] as? String
        cell.continentLabel.text = city["Continent"] as? String
        if cityIsMarked[rowIndex]{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView,
                     commit editingStyle: UITableViewCell.EditingStyle,
                     forRowAt indexPath: IndexPath){
        //刪除tableView的row
        print(cities[indexPath.row])
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let optionMenu = UIAlertController(title: nil, message: "您想要做什麼?", preferredStyle:.actionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: .default, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        
        //在actionSheet內，再加入一個UIAlertAction
        let callAction = UIAlertAction(title: "聯絡旅行社", style: .default){(action:UIAlertAction) -> Void in
            let alertMessage = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        optionMenu.addAction(callAction)
        
        //增加標示選項
        var titleName:String!;
        if self.cityIsMarked[indexPath.row]{
            titleName = "取消標示"
        }else{
            titleName = "標示"
        }
        
        let chekInMark = UIAlertAction(title: titleName, style: .default){
            (action:UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            switch titleName{
            case "取消標示":
                cell?.accessoryType = .none
                self.cityIsMarked[indexPath.row] = false;
            case "標示":
                cell?.accessoryType = .checkmark
                self.cityIsMarked[indexPath.row] = true;
            default:
                break
            }
            
        }
        
        optionMenu.addAction(chekInMark)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
}

