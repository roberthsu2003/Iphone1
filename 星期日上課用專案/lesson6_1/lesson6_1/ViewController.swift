//
//  ViewController.swift
//  lesson6_1
//
//  Created by 徐國堂 on 2021/4/25.
//

import UIKit

class ViewController: UIViewController {
    //awakeFromNib執行的時間點比viewDidLoad
    //這時間點不會使用到storyboard內的View
    
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")!
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for city in cities{
            print(city["City"] as! String)
        }
        
    }


}

