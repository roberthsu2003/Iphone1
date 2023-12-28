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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self //預設就為self
        navigationItem.title = "世界城市"
        tableView.rowHeight = 120
        //tableView.estimatedRowHeight = 100
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if cell.viewWithTag(1) == nil{
            //全新的
            //永遠不變的內容
            let imageView = UIImageView()
            imageView.tag = 1
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 50
            cell.contentView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            var con = [NSLayoutConstraint]()
            con.append(
                imageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            )
            
            con.append(
                imageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor
                                                    , constant: -16)
            )
            
            con.append(
                imageView.widthAnchor.constraint(equalToConstant: 100)
            )
            
            con.append(
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            )
            
            NSLayoutConstraint.activate(con)
        }
        
        //reuse
        //每次會改變的內容
        let imageView = cell.viewWithTag(1) as! UIImageView
        let originImage = UIImage(named: imageName)!
        let imageRender = UIGraphicsImageRenderer(
            bounds: CGRect(x: 0, y: 0, width: 150, height: 80),
            format: originImage.imageRendererFormat
        )
    
        let showImage = imageRender.image { _ in
            originImage.draw(in: CGRect.init(x: 0, y: 0, width: 150, height: 80))
        }
        imageView.image = showImage
        
        
        return cell
    
    
    }
    
    
}
