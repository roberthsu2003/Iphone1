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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let citysPath = Bundle.main.url(forResource: "citys", withExtension: "db")
        let db = FMDatabase(url: citysPath)
        db.open()
        //let query = "select * from movies where \(field_MovieCategory)=? order by \(field_MovieYear) desc"
        //let results = try database.executeQuery(query, values: ["Crime"])
        
        guard let rs = try? db.executeQuery("SELECT * from city where country = ?", values: ["Taiwan"]) else{
            print("執行錯誤")
            return;
        }
        while rs.next(){
            if let name = rs["cityName"] as? String{
                print(name)
            }
          
        }
        db.close()
    }


}

