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
