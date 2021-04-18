//
//  ViewController.swift
//  lesson5_1
//
//  Created by 徐國堂 on 2021/4/18.
//

import UIKit

class ViewController: UIViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
        let bundle = Bundle.main
        let url = bundle.url(forResource: "citylist", withExtension: "plist")!
        print(url.path)
        
        let array = NSArray(contentsOf: url)!
        let swiftArray = array as! [[String:Any]]
        for item in swiftArray{
            let cityName = item["City"] as! String
            print(cityName)
        }
 */
        
        if let url = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            if let citys = NSArray(contentsOf: url) as? [[String:Any]]{
                for city in citys{
                    let cityName = city["City"] as! String
                    print(cityName)
                }
            }
            
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }


}

