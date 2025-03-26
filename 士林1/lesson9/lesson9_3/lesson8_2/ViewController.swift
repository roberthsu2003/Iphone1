//
//  ViewController.swift
//  lesson8_2
//
//  Created by 徐國堂 on 2025/3/12.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITextFieldDelegate {
    @IBOutlet var tableView: UITableView!
    var cities = [[String:Any]]()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let url = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            do{
                let swiftArray = try NSArray(contentsOf: url, error: ())
                self.cities = swiftArray as? [[String:Any]] ?? [[String:Any]]()
            }catch{
                print(error.localizedDescription)
            }
        }else{
            print("沒有這個檔")
        }
              
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    //UITableViewDataSource
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let city = cities[index]
        if #available(iOS 15.0, *) {
            
        }else{
            let cityName = city["City"] as? String ?? "沒有城市名稱"
            let countryName = city["Country"] as? String ?? "沒有國家名稱"
            let imageName = city["Image"] as? String ?? "default"
            
            cell.textLabel?.text = cityName
            cell.detailTextLabel?.text = countryName
            cell.imageView?.image = UIImage(named: imageName)
        }
        
        
        return cell
    }


}

