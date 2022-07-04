//
//  ViewController.swift
//  project7
//
//  Created by 徐國堂 on 2022/7/4.
//

import UIKit

class ViewController: UIViewController {
    
    override func awakeFromNib() {
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有發現檔案")
            return
        }
        guard let cities = (try? NSArray(contentsOf: pathURL, error: ())) as? [[String:Any]] else{
            print("轉換為NSArray有問題")
            return
        }
        /*
        guard let cities = citys as? [[String:Any]] else{
            print("NSArray轉換為Array有問題")
            return
        }*/
        print(cities)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
    }


}

