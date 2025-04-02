//
//  ViewController.swift
//  lesson10_3
//
//  Created by 徐國堂 on 2025/4/2.
//

import UIKit

class ViewController: UITableViewController {
    
    var cities = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")else{
            return
        }
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]] ?? []
        
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }


    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row

        // Configure the cell’s contents.
        let city = cities[index]
        let cityName = city["City"] as? String ?? ""
        
        let countryName = city["Country"] as? String ?? ""
        let continentName = city["Continent"] as? String ?? ""
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTypeIdentifier", for: indexPath) as! CityCell
        cell.cityLabel.text = cityName
        cell.countryLabel.text = countryName
        cell.continentLabel.text = continentName
        cell.cityImageView.layer.cornerRadius = 30
        
        if let imageName = city["Image"] as? String{
            cell.cityImageView.image = UIImage(named: imageName)
        }else{
            cell.cityImageView = nil
        }
       
        
        
        
        
           
       return cell
    }
    //MARK: - UITableViewDelegate
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        
        let optionMenu = UIAlertController(title: nil, message: "您想要做什麼？", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        optionMenu.addAction(cancelAction)
        
        let callAction = UIAlertAction(title: "聯絡旅行社", style: .default) { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "連線失敗", message: "目前正在忙線中", preferredStyle: .alert);
                        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
                        self.present(alertMessage, animated: true, completion: nil);
        }
        
        optionMenu.addAction(callAction)
        self.present(optionMenu, animated: true)
    }
    

}

