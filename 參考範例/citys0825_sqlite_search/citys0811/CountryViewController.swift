//
//  CountryViewController.swift
//  citys0811
//
//  Created by Robert on 2019/8/18.
//  Copyright © 2019 ios1. All rights reserved.
//

import UIKit

class CountryViewController: UITableViewController {
   var countries:[String] = DataSource.main.countries ?? [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(countries);
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goCity" {
            let countryName = sender as! String;
            let receiveViewController = segue.destination as! CityOfCountryViewController
            receiveViewController.countryName = countryName
        }
    }
    

    

}

extension CountryViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return countries.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country;
        return cell;
    }
}

extension CountryViewController{
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let country = countries[indexPath.row]
        performSegue(withIdentifier: "goCity", sender: country)
    }
}
