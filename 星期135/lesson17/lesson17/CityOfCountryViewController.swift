//
//  CityOfCountryViewController.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/8/3.
//

import UIKit

class CityOfCountryViewController: UITableViewController {
    var country:String!
    var cities:[City]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = country
        cities = DataSource.singleton.getCities(withCountry: country)
        print(cities!)
    }
    

}
