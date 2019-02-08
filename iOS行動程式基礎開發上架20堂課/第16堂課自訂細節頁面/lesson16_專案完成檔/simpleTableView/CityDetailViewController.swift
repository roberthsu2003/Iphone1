//
//  CityDetailViewController.swift
//  Navigation
//
//  Created by Robert on 2019/2/6.
//  Copyright © 2019 gjun. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var cityImageView:UIImageView!;
    @IBOutlet var tableView:UITableView!;
    //var cityImageName:String?;
    //var cityName:String?;
    var city:City?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityImageView.image = UIImage(named: city?.image ?? "");
        title = city?.city;
        
        //change table appearance
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2);
        tableView.tableFooterView = UIView(frame: CGRect.zero);
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.6);
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.hidesBarsOnSwipe = false;
        navigationController?.setNavigationBarHidden(false, animated: true);
    }
    

    
}
extension CityDetailViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! DetailViewCell;
        cell.backgroundColor = UIColor.clear;
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text = "城市"
            cell.valueLabel.text = city?.city;
        case 1:
            cell.fieldLabel.text = "國家"
            cell.valueLabel.text = city?.country;
        case 2:
            cell.fieldLabel.text = "洲"
            cell.valueLabel.text = city?.continent;
        case 3:
            cell.fieldLabel.text = "網址"
            cell.valueLabel.text = city?.url;
        default:
            cell.fieldLabel.text = "";
            cell.valueLabel.text = "";
            
        }
        return cell;
    }
}
