//
//  ViewController.swift
//  lesson12_1
//
//  Created by 徐國堂 on 2021/5/30.
//

import UIKit
import FMDB

class ViewController: UIViewController {
    @IBOutlet var pickerView:UIPickerView!
    @IBOutlet var tableView:UITableView!
    //closure的執行
    //closure的執行只會執行一次
    //要return
    var countries:[String]? = {
        let citysPath = Bundle.main.url(forResource: "citys", withExtension: "db")
        let db = FMDatabase(url: citysPath)
        db.open()
        guard let rs = try? db.executeQuery("SELECT country from city  GROUP By country ORDER BY country  ASC", values: nil) else{
            print("執行錯誤")
            return nil;
        }
        var country = [String]()
        while rs.next(){
            if let countryName = rs["country"] as? String{
                country.append(countryName)
            }
          
        }
        db.close()
        
        return country
    }()
    
    func cities(countryName:String) -> [String]?{
        let citysPath = Bundle.main.url(forResource: "citys", withExtension: "db")
        let db = FMDatabase(url: citysPath)
        db.open()
        guard let rs = try? db.executeQuery("SELECT cityName from city  WHERE country = ? ", values: [countryName]) else{
            print("執行錯誤")
            return nil;
        }
        var cityNames = [String]()
        while rs.next(){
            if let cityName = rs["cityName"] as? String{
                cityNames.append(cityName)
            }
          
        }
        db.close()
        
        return cityNames
    }
    
    var cityOfCountry = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self;
        pickerView.delegate = self;
        tableView.dataSource = self;
    }
    
    
    
    
    

}

extension ViewController:UIPickerViewDataSource{
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int{
        let num = countries?.count ?? 0
        return num;
    }
}

extension ViewController:UIPickerViewDelegate{
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView,
                 titleForRow row: Int,
                 forComponent component: Int) -> String?{
        let message = countries?[row]
        return message
    }
    
    func pickerView(_ pickerView: UIPickerView,
                didSelectRow row: Int,
                inComponent component: Int){
       let country = countries![row]
       print(cities(countryName: country)!)
       cityOfCountry = cities(countryName: country)!
       tableView.reloadData()
    }
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cityOfCountry.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    }
}

