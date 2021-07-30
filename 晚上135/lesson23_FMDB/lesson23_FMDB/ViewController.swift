//
//  ViewController.swift
//  lesson23_FMDB
//
//  Created by 徐國堂 on 2021/7/30.
//

import UIKit
import FMDB

class ViewController: UIViewController {
    var database: FMDatabase!
    var targetURL:URL!
    
    func copySQLiteToDocuments(){
        let sourceURL = Bundle.main.url(forResource: "citys", withExtension: "db")!
        let fileManager = FileManager.default
        guard let targetURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
            print("targetURL路徑取得錯誤")
            return
        }
        self.targetURL = targetURL
        print(self.targetURL.path)
        self.targetURL.appendPathComponent("citys.db")
        
        if !fileManager.fileExists(atPath: self.targetURL.path){
            if let _ = try? fileManager.copyItem(at: sourceURL, to:self.targetURL){
                print("copy 成功")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        copySQLiteToDocuments()
        database = FMDatabase(url: self.targetURL)
        if let cityNames = cityesOFCountry(countryName: "Japan"){
            print(cityNames)
        }
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

