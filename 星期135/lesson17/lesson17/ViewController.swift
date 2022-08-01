//
//  ViewController.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/7/27.
//

import UIKit

class ViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let dataSource1 = DataSource.singleton
        let dataSource2 = DataSource.singleton
        
        if dataSource1 === dataSource2{
            print("相同的實體")
        }
        
        let bundle1 = Bundle.main
        let bundle2 = Bundle.main
        
        if bundle1 === bundle2{
            print("bundle是相同的實體")
        }
         */
        print(DataSource.singleton.getCountries())
        
        
    }


}

