//
//  RootViewController.swift
//  2lesson5_1
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit

class RootViewController: UITableViewController {
    let cellID = "cellID"
    var cities:[[String:Any]] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let mainBundle = Bundle.main
        if let plistURL = mainBundle.url(forResource: "citylist", withExtension: "plist"){
            //print(plistURL.path())
            do{
                let plistData = try Data(contentsOf: plistURL)
                self.cities = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [[String:Any]]
            }
            catch
            {
                print("讀檔錯誤")
            }
            
        }
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.backgroundColor = .brown
        tableView.dataSource = self //預設就為self
        navigationItem.title = "世界城市"
        //print(cities)
        
    }

}

extension RootViewController{
    //UITableViewController已經採納UITableViewDataSource
    
    
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        //每個section,多少個row
        return cities.count
    }
        
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell
    {
        //給Row資料
        let rowIndex = indexPath.row
        //print(rowIndex)
        //print("=====city資料==========")
        let city = cities[rowIndex]
        let cityName = city["City"] as? String ?? ""
        let countryName = city["Country"] as? String ?? ""
        let imageName = city["Image"] as? String ?? ""
       
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil{
            print(rowIndex)
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            //cell外觀永遠不會改變的
            let view1 = UIView()
            view1.backgroundColor = UIColor.white
            cell?.backgroundView = view1
            let selectedView = UIView()
            selectedView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
            cell?.selectedBackgroundView = selectedView
        }
        //cell外觀會改變的
        var contentConfiguration = cell?.defaultContentConfiguration()
        contentConfiguration?.text = cityName
        contentConfiguration?.textProperties.color = .systemRed
        contentConfiguration?.secondaryText = countryName
        contentConfiguration?.secondaryTextProperties.color = .systemGray
        contentConfiguration?.image = UIImage(named: imageName)
        cell?.contentConfiguration = contentConfiguration
        
        return cell!
    
    
    }
    
    
}
