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
            print(list[i-1])
        }
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    }


}

