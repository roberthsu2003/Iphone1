//
//  DetailViewController.swift
//  lesson15-2
//
//  Created by 徐國堂 on 2021/2/4.
//

import UIKit

class DetailViewController: UITableViewController {
    var city:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.city
        let headView = tableView.tableHeaderView as! UIImageView
        headView.image = UIImage(named: city.image ?? "")
                
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false;
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension DetailViewController{
    //UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 4;
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let detailViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as? DetailViewCell
            
        switch indexPath.row{
        case 0:
            detailViewCell?.fieldLabel.text = "城市"
            detailViewCell?.valueLabel.text = city.city
        case 1:
            detailViewCell?.fieldLabel.text = "國家"
            detailViewCell?.valueLabel.text = city.country
        case 2:
            detailViewCell?.fieldLabel.text = "洲"
            detailViewCell?.valueLabel.text = city.continent
        case 3:
            detailViewCell?.fieldLabel.text = "網址"
            detailViewCell?.valueLabel.text = city.url
        default:
            detailViewCell?.fieldLabel.text = ""
            detailViewCell?.valueLabel.text = ""
        }
        return detailViewCell!
    }
    
}

extension DetailViewController{
    //UITableViewDelegate
    
}
