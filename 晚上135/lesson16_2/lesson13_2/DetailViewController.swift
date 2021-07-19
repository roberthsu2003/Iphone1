//
//  DetailViewController.swift
//  lesson16_2
//
//  Created by 徐國堂 on 2021/7/14.
//

import UIKit

class DetailViewController: UITableViewController {
    var city:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

}

extension DetailViewController{
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return UITableViewCell()
    }
}

extension DetailViewController{
    //MARK - UITableViewDelegate
    
}
