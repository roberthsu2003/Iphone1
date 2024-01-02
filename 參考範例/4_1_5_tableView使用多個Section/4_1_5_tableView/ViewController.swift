//
//  ViewController.swift
//  4_1_5_tableView
//
//  Created by 徐國堂 on 2024/1/2.
//

import UIKit

class ViewController: UIViewController {
    let cellID = "CELL"
    
    @IBOutlet var tableView:UITableView!
    var states:[String:[String]] = DataSource.states
    lazy var names = [String](states.keys).sorted()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        DataSource.states
    }


}
extension ViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int{
        return names.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        let name = names[section]
        let postNums = states[name]!
        return postNums.count
    }
    
    
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        let section = indexPath.section
        let row = indexPath.row
        let name = names[section]
        let postNums = states[name]!
        let postNum = postNums[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var defaultContent = cell.defaultContentConfiguration()
        defaultContent.text = postNum
        defaultContent.textProperties.color = .brown
        cell.contentConfiguration = defaultContent
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String?{
        return names[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]?{
        return names
    }
}

