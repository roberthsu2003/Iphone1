//
//  ViewController.swift
//  lesson11_3
//
//  Created by 徐國堂 on 2021/7/2.
//

import UIKit

class ViewController:UIViewController,UITableViewDataSource {
    @IBOutlet var tableView:UITableView!
    var names:[String]!
    var countryCode:[String:String]!
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let namesURL = Bundle.main.url(forResource: "names", withExtension: "plist"){
            if let names = NSArray(contentsOf: namesURL) as? [String]{
                self.names = names
            }
        }
        
        if let codeURL = Bundle.main.url(forResource: "countryCode", withExtension: "plist"){
            if let countryCode = NSDictionary(contentsOf: codeURL) as? [String:String]{
                self.countryCode = countryCode
            }
        }
        
        if let cityURL = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            
            if let cities = NSArray(contentsOf: cityURL) as? [[String:AnyObject]]{
                self.cities = cities
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row
        let cityDic = cities[rowIndex]
        let cityName = cityDic["City"] as? String
        guard let cityImageName = cityDic["Image"] as? String else{
            print("傳出nil")
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        
        if #available(iOS 14.0, *){
            var content = cell.defaultContentConfiguration()
            content.text = cityName
            content.image = UIImage(named: cityImageName)
            content.imageProperties.maximumSize = CGSize(width: 100, height: 60)
            cell.contentConfiguration = content
        }else{
            cell.textLabel!.text = cityName
            cell.imageView!.image = UIImage(named: cityImageName)
        }
        
        return cell
        
    }


}

