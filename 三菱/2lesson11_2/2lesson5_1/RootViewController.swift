//
//  RootViewController.swift
//  2lesson5_1
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit

class RootViewController: UITableViewController {
    let cellID = "cellID"
    var cities:[City]
    /*
    lazy var cityISMarked:[Bool] = {
        let bools = Array(repeating: false, count: cities.count)
        return bools
    }()
     */
    
    required init?(coder: NSCoder) {
        self.cities = DataSource.main!.cities
        
        super.init(coder: coder)
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
        let cityName = city.city
        let countryName = city.country
        let imageName = city.image
        
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
        
        //cityISMarked[rowIndex] ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
        
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
        let city = self.cities[rowIndex]
        print(city)
        /*
        let markedState = !cityISMarked[rowIndex]
        if let cell = tableView.cellForRow(at: indexPath) as? MyCell{
            markedState ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
        }
        cityISMarked[rowIndex] = markedState
         */
        
        
    }
    
    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration?{
        let shareAction = UIContextualAction(style: .normal, title: "分享") { action, view, completionHandler in
            print("分享")
            completionHandler(true)
        }
        /*
        let deleteAction = UIContextualAction(style: .normal, title: "刪除") { action, view, completionHandler in
            print("刪除")
            completionHandler(true)
        }
         */
        shareAction.backgroundColor = .systemGreen
        //deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [shareAction])
    }
    
    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration?{
        let rowIndex = indexPath.row
        let deleteAction = UIContextualAction(style: .normal, title: "刪除") { [self] action, view, completionHandler in
            cities.remove(at: rowIndex)
            //cityISMarked.remove(at: rowIndex)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
