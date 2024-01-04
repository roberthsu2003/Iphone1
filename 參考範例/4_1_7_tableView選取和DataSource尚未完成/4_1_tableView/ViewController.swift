//
//  ViewController.swift
//  4_1_tableView
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit

class ViewController: UIViewController {
    var cities:[[String:Any]] = []
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        guard let sourcePath = Bundle.main.url(forResource: "citylist", withExtension: "plist") else
        {
            print("Bundle解析錯誤")
            return
        }
        do
        {
            let sourceData = try Data(contentsOf: sourcePath)
            cities = try PropertyListSerialization.propertyList(from: sourceData, format: nil) as? [[String:Any]] ?? [[String:Any]]()
            
        }
        catch
        {
            print(error)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(cities)
    }


}

