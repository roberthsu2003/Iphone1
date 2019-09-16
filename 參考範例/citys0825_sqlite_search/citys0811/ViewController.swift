//
//  ViewController.swift
//  citys0811
//
//  Created by Robert on 2019/8/11.
//  Copyright © 2019 ios1. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet var continentsSegmented:UISegmentedControl!;
    let continents = ["Asia", "Oceania", "Europe", "North America", "South America"];
    var citys:[City] = {
       
        guard let citys = DataSource.main.citys else{
            return [City]();
        }
        return citys;
        
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continentsSegmented.selectedSegmentIndex = -1;
        print("records:\(citys.count)");
    }
    
    @IBAction func userSelected(_ segmented:UISegmentedControl){
        let selectedContinent = continents[segmented.selectedSegmentIndex]
        print(selectedContinent);
        citys = DataSource.main[selectedContinent] ?? [City]()
        tableView.reloadData();
    }


}

extension ViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return citys.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let city = citys[indexPath.row]
        cell.textLabel?.text = city.name;
        cell.imageView?.image = UIImage(named: city.image)
        return cell;
    }
    
    
}

