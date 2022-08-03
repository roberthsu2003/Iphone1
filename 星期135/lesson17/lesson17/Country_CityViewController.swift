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
        return 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int{
       let countryNums =   DataSource.singleton.numberOfCountries(withContinent: selectedContinent)
        print(countryNums)
        return countryNums!
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
