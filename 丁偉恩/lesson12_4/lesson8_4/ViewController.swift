//
//  ViewController.swift
//  lesson8_4
//
//  Created by 徐國堂 on 2023/3/15.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet var cityTableView:UITableView!
    var cities = [City]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有檔案")
            return
        }
        guard let nsArray = try? NSArray(contentsOf: url, error:())else{
            print("解析錯誤")
            return
        }
        if let cityItems = nsArray as? [[String:Any]]{
            for dic_city in cityItems{
                let city = dic_city["City"] as? String ?? ""
                let country = dic_city["Country"] as? String ?? ""
                let continent = dic_city["Continent"] as? String ?? ""
                let image = dic_city["Image"] as? String ?? ""
                let local = dic_city["Local"] as? String ?? ""
                let url = dic_city["url"] as? String ?? ""
                let latitude = dic_city["lat"] as? Double ?? 0.0
                let longitude = dic_city["long"] as? Double ?? 0.0
                let oneCity = City(city: city, continent: continent, country: country, image: image, local: local, latitude: latitude, longitude: longitude, url: url)
                cities.append(oneCity)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        cityTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCity"{
            guard let indexPath = sender as? IndexPath else{
                return
            }
            let city = cities[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.city = city
            
        }
    }
    
    

}

extension ViewController:UITableViewDataSource{
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        return cities.count
    }
    
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        let index = indexPath.row
        let city = cities[index]
        let cityName = city.city
        let countryName = city.country
        let imageName = city.image
        let continentName = city.continent
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CityCell
        
        cell.cityLabel.text = cityName
        cell.continentLabel.text = continentName
        cell.countryLabel.text = countryName
        cell.cityImageView.image = UIImage(named: imageName)
        cell.cityImageView.layer.cornerRadius = 30
        
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        self.performSegue(withIdentifier: "showCity", sender: indexPath)
        
    }
    
    
    
    
}

