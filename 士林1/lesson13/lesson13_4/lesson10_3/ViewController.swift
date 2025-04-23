//
//  ViewController.swift
//  lesson10_3
//
//  Created by 徐國堂 on 2025/4/2.
//

import UIKit

class ViewController: UITableViewController {
    
    var cities = [City]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")else{
            return
        }
        let cities_dict = NSArray(contentsOf: pathURL) as? [[String:Any]] ?? []
        for city in cities_dict{
            let cityName = city["City"] as? String ?? ""
            let country = city["Country"] as? String ?? ""
            let continent = city["Continent"] as? String ?? ""
            let image = city["Image"] as? String ?? ""
            let local = city["Local"] as? String ?? ""
            let latitude = city["lat"] as? Double ?? 0
            let longitude = city["long"] as? Double ?? 0
            let url = city["url"] as? String ?? ""
            let oneCity = City(city: cityName, continent: continent, country: country, image: image, local: local, latiude: latitude, longitude: longitude, url: url)
            cities.append(oneCity)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else{
            return
        }
        
        if segue.identifier == "GO_DETAIL"{
            let destinationController = segue.destination as! DetailViewController
            destinationController.title = cities[indexPath.row].city
            let city = cities[indexPath.row]
            destinationController.city = city
        }
    }

}

extension ViewController{
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }


    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row

        // Configure the cell’s contents.
        let city = cities[index]
        let cityName = city.city
        
        let countryName = city.country
        let continentName = city.continent
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTypeIdentifier", for: indexPath) as! CityCell
        cell.cityLabel.text = cityName
        cell.countryLabel.text = countryName
        cell.continentLabel.text = continentName
        cell.cityImageView.layer.cornerRadius = 30
        
        let imageName = city.image
        cell.cityImageView.image = UIImage(named: imageName)
       
        cell.accessoryType = .disclosureIndicator
            
        
       
        
        
        
        
           
       return cell
    }
}

extension ViewController{
    //MARK: - UITableViewDelegate
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        
        
        self.performSegue(withIdentifier: "GO_DETAIL", sender: nil)
        
        
        
    }
    
    
    @available(iOS 8.0, *)
    override func tableView(
        _ tableView: UITableView,
        editActionsForRowAt indexPath: IndexPath
    ) -> [UITableViewRowAction]?{
        return nil
    }
    
    @available(iOS 11.0, *)
    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration?{
        let shareAction = UIContextualAction(style: .normal, title: "分享") {
            (action:UIContextualAction, view:UIView, completionHandler:@escaping (Bool) -> Void) in
            print("分享")
            completionHandler(true)
        }
        shareAction.backgroundColor = .systemGreen
        return UISwipeActionsConfiguration(actions: [shareAction])
    }
    
    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration?{
        let deleteAction = UIContextualAction(style: .normal, title: "刪除") {
            (action:UIContextualAction, view:UIView, completionHandler:@escaping (Bool) -> Void) in
            self.cities.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

