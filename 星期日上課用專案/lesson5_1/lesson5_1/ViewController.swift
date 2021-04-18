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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel!.text = cities[indexPath.row]["City"] as? String
        return cell
    }
    
    
    


}

