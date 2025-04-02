//
//  ViewController.swift
//  lesson10_3
//
//  Created by 徐國堂 on 2025/4/2.
//

import UIKit

class ViewController: UITableViewController {
    
    var cities = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")else{
            return
        }
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]] ?? []
        
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }


    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let index = indexPath.row
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellTypeIdentifier", for: indexPath)
       
       // Configure the cell’s contents.
       let city = cities[index]
       
        //cell.textLabel!.text = city["City"] as? String
           
       return cell
    }
    //MARK: - UITableViewDelegate


}

