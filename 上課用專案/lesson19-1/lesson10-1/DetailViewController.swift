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
        if let userRating = segue.identifier{
            switch userRating{
            case "n1":
                city.userRate = "科技化城市"
            case "n2":
                
                city.userRate = "風景不錯"
            case "n3":
               
                city.userRate = "很現代的城市"
            case "n4":
                
                city.userRate = "環保的城市"
            default:
                
                city.userRate = ""
            }
            tableView.reloadData()
        }
        
    }
 

}

extension DetailViewController{
    //UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 6;
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
            detailViewCell?.fieldLabel.text = "評比:"
            if city.userRate == ""{
                detailViewCell?.valueLabel.text = "目前無資料"
            }else{
                detailViewCell?.valueLabel.text = city.userRate
            }
            
        case 5:
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
