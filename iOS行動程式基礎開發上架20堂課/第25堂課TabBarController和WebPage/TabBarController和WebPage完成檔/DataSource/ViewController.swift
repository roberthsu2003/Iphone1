//
//  ViewController.swift
//  DataSource
//
//  Created by t1 on 2019/2/17.
//  Copyright © 2019年 gjun. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allCitys = [City](){
        didSet{
            tableView.reloadData();
        }
    }
    
    var continent:String! = nil{
        didSet{
            title = continent;
            allCitys = DataSource.singleton.selectedContinent(continentName: continent);
        }
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goWeb"{
            let webViewController = segue.destination as! WebViewController;          
            webViewController.url = sender as? String;
        }
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return allCitys.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row;
        let city = allCitys[rowIndex];       
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CityCell;
        cell.cityLabel.text = city.city;
        cell.countryLabel.text = city.country;
        cell.continentLabel.text = city.continent;
        cell.cityImageView.image = UIImage(named: city.image);
        return cell;
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let rowIndex = indexPath.row;
        let city = allCitys[rowIndex];
        self.performSegue(withIdentifier: "goWeb", sender: city.url);
    }



}



