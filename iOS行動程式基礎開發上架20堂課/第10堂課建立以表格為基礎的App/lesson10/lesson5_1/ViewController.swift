//
//  ViewController.swift
//  lesson5_1
//
//  Created by 徐國堂 on 2021/4/18.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var tableView:UITableView!
    
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
        let bundle = Bundle.main
        let url = bundle.url(forResource: "citylist", withExtension: "plist")!
        print(url.path)
        
        let array = NSArray(contentsOf: url)!
        let swiftArray = array as! [[String:Any]]
        for item in swiftArray{
            let cityName = item["City"] as! String
            print(cityName)
        }
 */
        
        if let url = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            if let citys = NSArray(contentsOf: url) as? [[String:Any]]{
                cities = citys
            }
            
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row
        let city = cities[rowIndex]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let cityName = city["City"] as? String
        let country = city["Country"] as? String
        let imageName = city["Image"] as? String ?? ""
        
        if #available(iOS 14, *) {
            //ios15以上使用這個程式區段
            //使用新的寫法
            var content = cell.defaultContentConfiguration()
            content.text = cityName
            content.secondaryText = country
            content.image = UIImage(named: imageName)
            content.imageProperties.reservedLayoutSize = CGSize(width: 80, height: 50)
            cell.contentConfiguration = content
            
        }else{
            //ios14以下的
            cell.textLabel!.text = cityName
            cell.detailTextLabel!.text = country
            cell.imageView!.image = UIImage(named: imageName)
        }
        
        print("傳出UITableViewCell")
        
        return cell
    }
    
    
    


}

