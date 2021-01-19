//
//  ViewController.swift
//  lesson10-1
//
//  Created by 徐國堂 on 2021/1/5.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
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
    
    
    //UITableViewDataSource
    
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
    
    //UITableViewDelegate
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
        
        
        let chekInMark = UIAlertAction(title: "標示", style: .default){
            (action:UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.cityIsMarked[indexPath.row] = true;
        }
        
        optionMenu.addAction(chekInMark)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    


}

