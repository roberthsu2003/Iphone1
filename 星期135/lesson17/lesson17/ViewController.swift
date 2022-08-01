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
    
    @IBAction func segmentsChange(_ sender:UISegmentedControl){
        let selectedIndex = sender.selectedSegmentIndex
        print(continents[selectedIndex])
    }
    
    override func awakeFromNib() {
        continents = DataSource.singleton.getContinents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (index,continent) in continents.enumerated(){
            segments.setTitle(continent, forSegmentAt: index)
        }
    }
    
    


}

