//
//  RootViewController.swift
//  2lesson5_1
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit

class RootViewController: UITableViewController {

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
        print(indexPath.row)
        return UITableViewCell(style: .default, reuseIdentifier: "cellID")
    }
    
}
