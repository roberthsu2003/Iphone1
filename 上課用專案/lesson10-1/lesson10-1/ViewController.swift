//
//  ViewController.swift
//  lesson10-1
//
//  Created by 徐國堂 on 2021/1/5.
//

import UIKit

class ViewController: UIViewController {
    //要依據plist的架構來設定cities的資料類型
    //如果使用type!,代表暫時是nil,第一下就有值
    var cities:[[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathUrl = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("程式出錯了")
            return
        }
        
        let tempArray = NSArray(contentsOf: pathUrl)
        cities = tempArray as? [[String:Any]]
        print(cities)
        
        
        
        
        
    }


}

