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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")!
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.dataSource = self
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel!.text = cityName
        cell.imageView!.image = UIImage(named: imageName)
        return cell
    }

}

