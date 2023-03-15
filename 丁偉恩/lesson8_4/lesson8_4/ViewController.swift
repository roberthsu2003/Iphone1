//
//  ViewController.swift
//  lesson8_4
//
//  Created by 徐國堂 on 2023/3/15.
//

import UIKit

class ViewController: UIViewController {
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有檔案")
            return
        }
        guard let nsArray = try? NSArray(contentsOf: url, error:())else{
            print("解析錯誤")
            return
        }
        cities = nsArray as? [[String:Any]]      
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for item in cities!{
            print(item)
        }
    }


}

