//
//  ViewController.swift
//  lesson8_4
//
//  Created by 徐國堂 on 2023/3/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cityTableView:UITableView!
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有檔案")
            return
        }
        guard let nsArray = try? NSArray(contentsOf: url, error:())else{
            print("解析錯誤")
            return
        }
        cities = nsArray as? [[String:Any]]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
    }
    
    

}

extension ViewController:UITableViewDataSource{
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        return cities.count
    }
    
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        let index = indexPath.row
        let city = cities[index]
        let cityName = city["City"] as? String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        cell.textLabel!.text = cityName
        return cell
    }
}

