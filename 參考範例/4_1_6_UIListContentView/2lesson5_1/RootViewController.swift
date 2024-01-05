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
    var cityIsMarked = [Bool]()
    
    required init?(coder: NSCoder) {
        let mainBundle = Bundle.main
        if let plistURL = mainBundle.url(forResource: "citylist", withExtension: "plist"){
            //print(plistURL.path())
            do{
                let plistData = try Data(contentsOf: plistURL)
                self.cities = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [[String:Any]]
                cityIsMarked = Array(repeating: false, count: self.cities.count)
            }
            catch
            {
                print("讀檔錯誤")
            }
            
        }
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "城市"
        tableView.dataSource = self //預設就為self
       
        
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 15)     
        
        self.tableView.rowHeight = 100
        
        //建立UIBarButtonItem
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem.init(systemItem: .camera, primaryAction: UIAction(handler: { _ in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let list_navi = storyboard.instantiateViewController(withIdentifier: "ListXib") as! UINavigationController
                self.present(list_navi, animated: true)
            })),
            UIBarButtonItem.init(title: "picker", primaryAction: UIAction(handler: { _ in
                print("picker")
            }))
        ]
        
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
    ) -> UITableViewCell{
        //給Row資料
        let rowIndex = indexPath.row
        let city = cities[rowIndex]
        let cityName = city["City"] as? String
        let countryName = city["Country"] as? String
        let imageName = city["Image"] as? String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyCell
        
        
        
        if indexPath.row % 2 == 1{
            let leftInsets:CGFloat = 50
            cell.separatorInset = UIEdgeInsets(top: 0, left: leftInsets, bottom: 0, right: 0)
            cell.leadingConstraint.constant = leftInsets

        }else{
            let leftInsets:CGFloat = 20
            cell.separatorInset = UIEdgeInsets(top: 0, left: leftInsets, bottom: 0, right: 0)
            cell.leadingConstraint.constant = leftInsets
        }
         
        
        //貼上標誌,new 或者 reuse
        if cell.titleLabel.tag == 0{
            //new
            cell.titleLabel.tag = 1
        }
        //new 或 reuse全都改變內容
        cell.titleLabel.text = cityName
        cell.subLabel.text = countryName
        let image = UIImage(named: imageName!)!
        //用等比例的方法
        let imageRender = UIGraphicsImageRenderer(size: CGSize(width: 150, height: 80), format: image.imageRendererFormat)
        let image2 = imageRender.image { _ in
            image.draw(in: CGRect(x: 0, y: 0, width: 150, height: 80))
        }
        cell.cityImage.image = image2
        
        cityIsMarked[rowIndex] ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
        //增加background
        //如果MyCell有 override func updateConfiguration(using state: UICellConfigurationState),這就沒有背景效果
        /*
        var back = UIBackgroundConfiguration.listPlainCell()
        back.backgroundColor = .blue.withAlphaComponent(0.1)
        back.backgroundInsets =  NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        cell.backgroundConfiguration = back
         */
        
        return cell
        
        
    }
    
}

extension RootViewController{
    //Mark - UITableViewDelegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        //取消選取
        tableView.deselectRow(at: indexPath, animated: false)
        
        //取得cell
        let cell = tableView.cellForRow(at: indexPath) as! MyCell
        //checkmark,顯示或消失
        let state = !cityIsMarked[indexPath.row]
        state ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
        cityIsMarked[indexPath.row] = state
    }
    
    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration?{
        let shareAction = UIContextualAction(style: .normal, title: "分享") { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
            print("分享")
            completionHandler(true)
        }
        
        let deleteAction = UIContextualAction(style: .normal, title: "刪除") { action, view, completionHandler in
            self.cities.remove(at: indexPath.row)
            self.cityIsMarked.remove(at: indexPath.row)
            print("現在剩下的資料還有\(self.cities.count)")
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        shareAction.backgroundColor = UIColor.systemGreen
        deleteAction.backgroundColor = UIColor.systemRed
        return UISwipeActionsConfiguration(actions: [shareAction, deleteAction])
    }
}
