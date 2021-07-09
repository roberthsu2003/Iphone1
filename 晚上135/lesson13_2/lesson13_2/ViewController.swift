//
//  ViewController.swift
//  lesson13_2
//
//  Created by 徐國堂 on 2021/7/7.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var tableView:UITableView!
    var cities:[[String:Any]]={
        if let plistURL = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            if let array = NSArray(contentsOf: plistURL) as? [[String:Any]]{
                return array
            }
        }
        return [[String:Any]]()
    }()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return UITableViewCell()
    }


}

