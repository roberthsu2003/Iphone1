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
        tableView.dataSource = self
        tableView.delegate = self
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
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    
}

