//
//  SearchViewController.swift
//  lesson23_FMDB
//
//  Created by 徐國堂 on 2021/8/2.
//

import UIKit
import FMDB

class SearchViewController: UITableViewController {
    
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
    
    lazy var database:FMDatabase = {
        FMDatabase(url: self.targetURL)
    }()
    
    var cities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = getAllCities()
    }
    
    func getAllCities() -> [String]{        
        return [String]()
    }

    
}
