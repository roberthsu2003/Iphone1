//
//  CityDetalViewController.swift
//  project11
//
//  Created by 徐國堂 on 2022/7/11.
//

import UIKit

class CityDetailViewController: UITableViewController {
    @IBOutlet var cityImageView:UIImageView!
    
    var city:City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.city
        cityImageView.image = UIImage(named: city.image)
        
    }
    
    @IBAction func ratingClick(_ sender:UIBarButtonItem){
        performSegue(withIdentifier: "goRate", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goWeb"{
            let webViewController = segue.destination as! WebViewController
            webViewController.city = city
        }else if segue.identifier == "goRate"{
            let rateViewController = segue.destination as! RatingViewController
            rateViewController.city = city
        }
    }
    
    @IBAction func userClose(_ segue:UIStoryboardSegue){
        if let userRating = segue.identifier{
            switch userRating{
            case "n1":                
                city.userRate = "科技化城市"
            case "n2":
                city.userRate = "風景不錯"
            case "n3":
                city.userRate = "現代化城市"
            case "n4":
                city.userRate = "環保的城市"
            default:
                print("default")
            }
            
            tableView.reloadData()
        }
    }
}

extension CityDetailViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 6;
    }
    
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! DetailViewCell
        
        switch indexPath.row{
        case 0:
            cell.fieldLabel?.text = "城市"
            cell.valueLabel?.text = city.city
        case 1:
            cell.fieldLabel?.text = "國家"
            cell.valueLabel?.text = city.country
        case 2:
            cell.fieldLabel?.text = "洲"
            cell.valueLabel?.text = city.continent
        case 3:
            cell.fieldLabel?.text = "網址"
            cell.valueLabel?.text = city.url
            cell.accessoryType = .disclosureIndicator
        case 4:
            cell.fieldLabel?.text = "描繪"
            if let userRate = city.userRate{
                cell.valueLabel?.text = userRate
            }else{
                cell.valueLabel?.text = "目前無資料"
            }
            
        case 5:
            cell.fieldLabel?.text = "說明"
            cell.valueLabel?.text = city.local
        default:
            break
            
        }
        return cell
       
    }
}

extension CityDetailViewController{
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        if indexPath.row == 3{
            return indexPath
        }else{
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath){
        
        if indexPath.row == 3{
            performSegue(withIdentifier: "goWeb", sender: nil)
        }
    }
}


