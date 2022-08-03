//
//  ViewController.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/7/27.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet var segments:UISegmentedControl!
    var continents:[String]!
    var selectedContinent:String!
    var currentCountries:[String]!
    
    @IBAction func segmentsChange(_ sender:UISegmentedControl){
        let selectedIndex = sender.selectedSegmentIndex
        print(continents[selectedIndex])
        selectedContinent = continents[selectedIndex]
        guard let countries = DataSource.singleton.getCountries(withContinents:selectedContinent) else{
            return
        }
        
        currentCountries = countries
        tableView.reloadData()
        print(currentCountries!)
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

extension ViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return currentCountries.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let country = currentCountries[indexPath.row]
        if #available(iOS 15, *){
            var content = cell.defaultContentConfiguration()
            content.text = country;
            
            cell.contentConfiguration = content
        }else{
            cell.textLabel?.text = country
            
        }
        
        return cell;
    }
}

