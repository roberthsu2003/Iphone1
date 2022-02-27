//
//  CityDetailViewController.swift
//  project10
//
//  Created by 徐國堂 on 2022/2/13.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var cityImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    var city:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = city.city
        
        tableView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
        tableView.separatorColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
        cityImageView.image = UIImage(named: city.image)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func userClose(_ segue:UIStoryboardSegue){
        print("colse")
    }

}

extension CityDetailViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! DetailViewCell
        cell.backgroundColor = UIColor.clear
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text = "城市"
            cell.valueLabel.text = city.city
        case 1:
            cell.fieldLabel.text = "國家"
            cell.valueLabel.text = city.country
        
        case 2:
            cell.fieldLabel.text = "洲"
            cell.valueLabel.text = city.continent
            
        case 3:
            cell.fieldLabel.text = "網址"
            cell.valueLabel.text = city.url
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
       
        return cell;
    }
    
    
}

extension CityDetailViewController:UITableViewDelegate{
    
}
