//
//  ViewController.swift
//  lesson12_1
//
//  Created by 徐國堂 on 2021/5/30.
//

import UIKit
import FMDB

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet var pickerView:UIPickerView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self;
        pickerView.delegate = self;
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int{
        let num = countries?.count ?? 0
        return num;
    }
    
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
       print(country)
    }
    
    

}

