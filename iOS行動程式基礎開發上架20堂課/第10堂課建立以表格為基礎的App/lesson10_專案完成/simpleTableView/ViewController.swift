//
//  ViewController.swift
//  simpleTableView
//
//  Created by t1 on 2019/1/20.
//  Copyright © 2019年 gjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource { //第二步
    @IBOutlet var cityTableView:UITableView!;
    var citys:[[String:Any]]!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main;
        let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")!;
        citys = NSArray(contentsOf: pathURL) as? [[String:Any]];
        //告知cityTableView的dataSource是誰
        cityTableView.dataSource = self;//第一步
    }
//3實作mehtod
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return citys.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row;
        let cityDic = citys[rowIndex];
        let cityName = cityDic["City"] as? String;
        let imageName = cityDic["Image"] as? String;
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath);
        cell.textLabel!.text = cityName;        
        cell.imageView!.image = UIImage(named: imageName!);
        return cell;
    }


}

