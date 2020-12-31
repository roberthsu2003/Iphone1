//
//  ViewController.swift
//  lesson10-ios14
//
//  Created by 徐國堂 on 2020/12/31.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var cityTableView:UITableView!
    var cities:[[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //利用Bundle.main載入Bundle內的citylist.plist
        let bundle = Bundle.main;
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有發現些檔案")
            return
        }
        
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]]
        
        cityTableView.dataSource = self;
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    }
}

