//
//  ViewController.swift
//  4_1_5_tableView
//
//  Created by 徐國堂 on 2024/1/2.
//

import UIKit

class ViewController: UIViewController {
    let cellID = "CELL"
    let headerID = "Header"
    
    @IBOutlet var tableView:UITableView!
    var states:[String:[String]] = DataSource.states
    lazy var names = [String](states.keys).sorted()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerID)
        tableView.sectionIndexColor = .white
        tableView.sectionIndexBackgroundColor = .red
        tableView.sectionIndexTrackingBackgroundColor = .blue
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

extension ViewController:UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView?{
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID)
        headerView?.tintColor = .red //顯示紅色背景,等一下會被backgroundView蓋住
        if headerView?.viewWithTag(1) == nil{
            headerView?.backgroundView = UIView()
            headerView?.backgroundView?.backgroundColor = .black
            let lab = UILabel()
            lab.tag = 1
            lab.font = UIFont(name: "Georgia-Bold", size: 16)
            lab.textColor = .green
            lab.backgroundColor = .clear
            headerView?.contentView.addSubview(lab)
            
            let v = UIImageView()
            v.tag = 2
            v.backgroundColor = .black
            v.image = UIImage(systemName: "square.and.arrow.down")
            
            headerView?.contentView.addSubview(v)
            lab.translatesAutoresizingMaskIntoConstraints = false
            v.translatesAutoresizingMaskIntoConstraints = false
            let constraints = [NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[lab]-10-[v(40)]", metrics: nil, views: ["v":v,"lab":lab]),
                               NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v(40)]", metrics: nil, views: ["v":v,"lab":lab]),
                               NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[lab]|", metrics: nil, views: ["v":v,"lab":lab])
            ].flatMap { $0 }
            NSLayoutConstraint.activate(constraints)
        }
        
        let lab = headerView?.contentView.viewWithTag(1) as! UILabel
        lab.text = names[section]
        return headerView
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat{
        return 60
    }
}

