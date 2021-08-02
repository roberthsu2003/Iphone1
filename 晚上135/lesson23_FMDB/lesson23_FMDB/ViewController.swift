//
//  ViewController.swift
//  lesson23_FMDB
//
//  Created by 徐國堂 on 2021/7/30.
//

import UIKit
import FMDB

class ViewController: UIViewController {
    @IBOutlet var pickerView:UIPickerView!
    
    lazy var database:FMDatabase = {
        FMDatabase(url: self.targetURL)
    }()
    
    lazy var targetURL:URL? = {
        let fileManager = FileManager.default
        guard var targetURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
            print("targetURL路徑取得錯誤")
            return nil
        }
        
        print(targetURL.path)
        targetURL.appendPathComponent("citys.db")
        return targetURL
    }()
    
    lazy var countrys:[String] = {
        database.open()
        guard let rs = try? database.executeQuery("SELECT country from city  GROUP BY country", values: nil)else{
            return [String]()
        }
        var countries = [String]()
        while rs.next(){
            if let country = rs["country"] as? String{
                countries.append(country)
            }
        }
        database.close()
        return countries
    }()
    
    
    
    func copySQLiteToDocuments(){
        let sourceURL = Bundle.main.url(forResource: "citys", withExtension: "db")!
        let fileManager = FileManager.default
               
        if !fileManager.fileExists(atPath: self.targetURL!.path){
            if let _ = try? fileManager.copyItem(at: sourceURL, to:self.targetURL!){
                print("copy 成功")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func cityesOFCountry(countryName:String) -> [String]?{
        database.open()
        guard let rs = try? database.executeQuery("SELECT cityName from city WHERE country=?", values: [countryName]) else{
            print("sql出錯了")
            return nil
        }
        var cityNames = [String]()
        while rs.next(){
            if let cityName = rs["cityName"] as? String{
                cityNames.append(cityName)
            }
        }
        database.close()
        return cityNames
    }
    
    


}

extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int{
        return countrys.count;
    }
}

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView,
                 titleForRow row: Int,
                 forComponent component: Int) -> String?{
        return countrys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                didSelectRow row: Int,
                inComponent component: Int){
        let selectedCountry = countrys[row]
        print(cityesOFCountry(countryName: selectedCountry)!)
    }
}

