//
//  ViewController.swift
//  lesson12_1
//
//  Created by 徐國堂 on 2021/5/30.
//

import UIKit
import FMDB

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let citysPath = Bundle.main.url(forResource: "citys", withExtension: "db")
        let db = FMDatabase(url: citysPath)
        db.open()
        guard let rs = try? db.executeQuery("SELECT * from city", values: nil) else{
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

