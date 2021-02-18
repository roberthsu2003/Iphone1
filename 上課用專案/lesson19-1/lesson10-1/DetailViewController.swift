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
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2);
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.6);
                
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false;
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func userClose(_ segue:UIStoryboardSegue){
        print(segue.identifier)
        
    }
 

}

extension DetailViewController{
    //UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 5;
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let detailViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as? DetailViewCell
        
        detailViewCell?.backgroundColor = UIColor.clear
            
        switch indexPath.row{
        case 0:
            detailViewCell?.fieldLabel.text = "城市:"
            detailViewCell?.valueLabel.text = city.city
        case 1:
            detailViewCell?.fieldLabel.text = "國家:"
            detailViewCell?.valueLabel.text = city.country
        case 2:
            detailViewCell?.fieldLabel.text = "洲:"
            detailViewCell?.valueLabel.text = city.continent
        case 3:
            detailViewCell?.fieldLabel.text = "網址:"
            detailViewCell?.valueLabel.text = city.url
        case 4:
            detailViewCell?.fieldLabel.text = "簡介:"
            detailViewCell?.valueLabel.text = city.local
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
