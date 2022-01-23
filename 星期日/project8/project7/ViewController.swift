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
        return cityCell
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let optionMenu = UIAlertController(title:nil, message: "您想要做什麼?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        let callAction = UIAlertAction(title: "聯絡旅行示", style:.default, handler: {(action:UIAlertAction) -> Void in  //closure,呼叫ViewController 的 property 和 method必需使用self
            let alertMessage = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        })
        
        optionMenu.addAction(callAction)
        
        present(optionMenu, animated: true, completion: nil)
    }
    

}

