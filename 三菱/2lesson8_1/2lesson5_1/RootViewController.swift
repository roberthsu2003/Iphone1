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
    var cityISMarked = [Bool]()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let mainBundle = Bundle.main
        if let plistURL = mainBundle.url(forResource: "citylist", withExtension: "plist"){
            //print(plistURL.path())
            do{
                let plistData = try Data(contentsOf: plistURL)
                self.cities = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [[String:Any]]
                cityISMarked = Array(repeating: false, count: self.cities.count)
            }
            catch
            {
                print("讀檔錯誤")
            }
            
        }
        print("storyboard 預設的初始化位址")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self //預設就為self
        tableView.delegate = self //預設就是self
        navigationItem.title = "世界城市"
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.rowHeight = 100
        //tableView.estimatedRowHeight = 100
        //print(cities)
        
    }

}

extension RootViewController{
    //Mark - UITableViewDataSource
    
    
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyCell
        
        
        
        cell.myImageView.contentMode = .scaleAspectFill
        cell.myImageView.layer.cornerRadius = 40
        let sourceImage = UIImage(named: imageName)!
        let imageRender = UIGraphicsImageRenderer(size: CGSize.init(width: 150, height: 80), format: sourceImage.imageRendererFormat)
        let smallImage = imageRender.image { (context:UIGraphicsImageRendererContext) in
            sourceImage.draw(in: CGRect.init(x: 0, y: 0, width: 150, height: 80))
        }
        cell.myImageView.image = smallImage       
        
        cell.titleLabel.text = cityName
        
        cell.subLabel.text = countryName
        
        cityISMarked[rowIndex] ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
        
        return cell
    
    
    }
    
    
}


extension RootViewController{
    //Mark: - UITableViewDelegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        let rowIndex = indexPath.row
        //let city = self.cities[rowIndex]
        //print(city)
        let markedState = !cityISMarked[rowIndex]
        if let cell = tableView.cellForRow(at: indexPath) as? MyCell{
            markedState ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
        }
        cityISMarked[rowIndex] = markedState
        
        
    }
    
}
