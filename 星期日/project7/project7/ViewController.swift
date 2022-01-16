//
//  ViewController.swift
//  project7
//
//  Created by 徐國堂 on 2022/1/16.
//

import UIKit

class ViewController: UIViewController {
    var cities:[[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //只執行一次,可以利用這個特性,在這裏做,所有storeProperty初始化
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            return
        }
        
        if #available(iOS 11.0, *){
            guard let city = try! NSArray(contentsOf: pathURL, error: ()) as? [[String:Any]] else{
                return
            }
            cities = city
            
        }else{
            
            guard let city = NSArray(contentsOf: pathURL) as? [[String:Any]] else{
                return
            }
            cities = city
            
        }
        
        
        print(cities)
        
        
    }


}

