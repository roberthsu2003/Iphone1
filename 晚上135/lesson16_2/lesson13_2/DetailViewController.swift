//
//  DetailViewController.swift
//  lesson16_2
//
//  Created by 徐國堂 on 2021/7/14.
//

import UIKit

class DetailViewController: UITableViewController {
    var city:City!
    @IBOutlet var cityImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.city
        cityImageView.image = UIImage(named: city.image)
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1)
        /*
        let footerView =  UIView(frame: CGRect.init(x: 0, y: 0, width: 60, height: 100))
        footerView.backgroundColor = UIColor.systemRed

        tableView.tableFooterView = footerView
         */
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1)
    }
    

}

extension DetailViewController{
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return UITableViewCell()
    }
}

extension DetailViewController{
    //MARK - UITableViewDelegate
    
}
