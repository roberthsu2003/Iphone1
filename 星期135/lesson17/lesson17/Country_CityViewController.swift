//
//  Country_CityViewController.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/8/3.
//

import UIKit

class Country_CityViewController: UITableViewController {
    @IBOutlet var segments:UISegmentedControl!
    var continents:[String]!
    var selectedContinent:String!
    var countries:[String]!
    
    @IBAction func segmentsChange(_ sender:UISegmentedControl){
        let selectedIndex = sender.selectedSegmentIndex
        print(continents[selectedIndex])
        selectedContinent = continents[selectedIndex]
        print(selectedContinent)
        tableView.reloadData()
        
    }
    override func awakeFromNib() {
        continents = DataSource.singleton.getContinents()
        selectedContinent = continents[0]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (index,continent) in continents.enumerated(){
            segments.setTitle(continent, forSegmentAt: index)
        }
        //呼叫IBAction
        segmentsChange(segments)
       
    }

    
}

extension Country_CityViewController{
    //UITableViewDataSource
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        let country = countries[section]
        guard let cities = DataSource.singleton.getCities(withCountry: country) else{
            return 0
        }
        
        return cities.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        countries = DataSource.singleton.getCountries(withContinents: selectedContinent)
        return countries!.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let section = indexPath.section
        let country = countries[section]
        
        let row = indexPath.row
        guard let cities = DataSource.singleton.getCities(withCountry: country) else{
            return UITableViewCell()
        }
        let city = cities[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        if #available(iOS 15, *){
            var content = cell.defaultContentConfiguration()
            content.text = city.city
            content.secondaryText = city.country
            content.image = UIImage(named: city.image)
            content.imageProperties.reservedLayoutSize = CGSize(width: 80, height: 50)
            cell.contentConfiguration = content
        }else{
            cell.textLabel?.text = city.city
            cell.detailTextLabel?.text =  city.country
            cell.imageView?.image = UIImage(named: city.image)
        }
        
        return cell;
        
        
        
    }
     
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String?{
        return countries[section]
    }
     
    
    
    
}
