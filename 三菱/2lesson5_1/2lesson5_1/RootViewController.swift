//
//  RootViewController.swift
//  2lesson5_1
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit

class RootViewController: UITableViewController {
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .brown
        tableView.dataSource = self //預設就為self
    }

}

extension RootViewController{
    //UITableViewController已經採納UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        //多少個section
        return 1
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        //每個section,多少個row
        return 100
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        //給Row資料
        let rowIndex = indexPath.row
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil{
            //print(rowIndex)
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            //cell外觀永遠不會改變的
            cell?.textLabel?.textColor = .systemRed
            let imageView = UIImageView(image: UIImage(named: "linen.png"))
            imageView.contentMode = .scaleToFill
            cell?.backgroundView = imageView
            let selectedView = UIView()
            selectedView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
            cell?.selectedBackgroundView = selectedView
        }
        //cell外觀會改變的
        cell?.textLabel?.text = "cell-\(rowIndex)"
        return cell!
    }
    
}
