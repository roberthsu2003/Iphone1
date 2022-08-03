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
        let cities = DataSource.singleton.getCities(withCountry: country)
        print(cities?.count)
        return 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        countries = DataSource.singleton.getCountries(withContinents: selectedContinent)
        return countries!.count
    }
    /*
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String?{
        
    }
     */
    
    
    
}
