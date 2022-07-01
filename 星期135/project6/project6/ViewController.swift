//
//  ViewController.swift
//  project6
//
//  Created by 徐國堂 on 2022/7/1.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var tableView:UITableView!
    var list:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100{
            list.append("item\(i)")
        }
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return list.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        //版本檢查
        if #available(iOS 15, *){
            var content = cell.defaultContentConfiguration()
            content.text = list[rowIndex]
            cell.contentConfiguration = content
        }else{
            cell.textLabel?.text = list[rowIndex]
        }
        
        return cell
    }


}

