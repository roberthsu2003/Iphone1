//
//  ViewController.swift
//  2lesson19_2
//
//  Created by 徐國堂 on 2024/2/27.
//

import UIKit
class MyCell:UITableViewCell{
    
}

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    let cellId = "CELL"
    var cities = [City]()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if let cities = DataSource.main.getCities(){
            self.cities = cities
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "世界城市"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
    }

}

extension ViewController:UITableViewDataSource{
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        return self.cities.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MyCell
        var configuration = cell.defaultContentConfiguration()
        let city = cities[indexPath.row]
        configuration.text = city.name
        configuration.secondaryText = city.country
        cell.contentConfiguration = configuration
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat{
        //return UITableView.automaticDimension
        return 80
    }
}

