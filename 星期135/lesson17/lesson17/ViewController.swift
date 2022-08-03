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

