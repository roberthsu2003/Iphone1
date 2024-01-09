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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
         
        var backgroundConfigure = cell.defaultBackgroundConfiguration()
        backgroundConfigure.backgroundColor = .blue.withAlphaComponent(0.2)
        backgroundConfigure.cornerRadius = 5
        backgroundConfigure.backgroundInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        cell.backgroundConfiguration = backgroundConfigure
        
        
        return cell
    
    
    }
    
    
}


extension RootViewController{
    //Mark: - UITableViewDelegate
    
}
