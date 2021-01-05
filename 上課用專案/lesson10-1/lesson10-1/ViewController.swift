//
//  ViewController.swift
//  lesson10-1
//
//  Created by 徐國堂 on 2021/1/5.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var cityTableView:UITableView!
    //要依據plist的架構來設定cities的資料類型
    //如果使用type!,代表暫時是nil,第一下就有值
    var cities:[[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        let bundle = Bundle.main
        guard let pathUrl = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("程式出錯了")
            return
        }
        
        let tempArray = NSArray(contentsOf: pathUrl)
        cities = tempArray as? [[String:Any]]
        for city in cities{
            print(city)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 100;
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Hello! World!"
        return cell;
    }


}

