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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goRate"{
            let rateViewController = segue.destination as! RateViewController
            rateViewController.city = city
            rateViewController.callBackMethod = {
                (passbackString:String)->Void in
                print("傳回來的字串是\(passbackString)")
            }
        }
    }
    
    @IBAction func userDismiss(_ sender:UIStoryboardSegue){
        switch sender.identifier{
        case "n1":
            city.userRate = "科技化城市"
        case "n2":
            city.userRate = "風景城市"
        case "n3":
            city.userRate = "現代化城市"
        case "n4":
            city.userRate = "環保城市"
        default:
            print("default")
        }
        tableView.reloadData()
    }
    

}

extension DetailViewController{
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 6
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text = "城市:"
            cell.valueLabel.text = city.city
        case 1:
            cell.fieldLabel.text = "國家:"
            cell.valueLabel.text = city.country
        case 2:
            cell.fieldLabel.text = "洲:"
            cell.valueLabel.text = city.continent
        case 3:
            cell.fieldLabel.text = "網址:"
            cell.valueLabel.text = city.url
        case 4:
            cell.fieldLabel.text = "描繪:"
            if let userRate = city.userRate{
                cell.valueLabel.text = userRate
            }else{
                cell.valueLabel.text = "目前無資料"
            }
            
        case 5:
            cell.fieldLabel.text = "簡介:"
            cell.valueLabel.text = city.local
        default:
            cell.fieldLabel.text = "網址:"
            cell.valueLabel.text = city.url
        }
        
        return cell
    }
}

extension DetailViewController{
    //MARK - UITableViewDelegate
    
}
