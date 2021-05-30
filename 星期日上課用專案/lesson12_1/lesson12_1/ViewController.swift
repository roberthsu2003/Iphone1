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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self;
        pickerView.delegate = self;
        
        let citysPath = Bundle.main.url(forResource: "citys", withExtension: "db")
        let db = FMDatabase(url: citysPath)
        db.open()
        //let query = "select * from movies where \(field_MovieCategory)=? order by \(field_MovieYear) desc"
        //let results = try database.executeQuery(query, values: ["Crime"])
        
        guard let rs = try? db.executeQuery("SELECT country from city  GROUP By country ORDER BY country  ASC", values: nil) else{
            print("執行錯誤")
            return;
        }
        while rs.next(){
            if let name = rs["country"] as? String{
                print(name)
            }
          
        }
        db.close()
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int{
        return 10;
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView,
                 titleForRow row: Int,
                 forComponent component: Int) -> String?{
        let message = "row:\(row),component:\(component)"
        return message
    }
    
    

}

