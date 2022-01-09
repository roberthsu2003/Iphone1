//
//  ViewController.swift
//  project6
//
//  Created by 徐國堂 on 2022/1/9.
//

import UIKit

class ViewController: UIViewController {
    
    var cities:[[String:Any]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            //false程式區塊
            print("出錯了!沒有這個檔")
            return
        }
       
        if #available(iOS 11.0, *){
            guard let city = try! NSArray(contentsOf: pathURL, error: ()) as? [[String:Any]] else{
                print("轉換錯誤")
                return
            }
            self.cities = city
            
        }else{
            guard let city = NSArray(contentsOf: pathURL) as? [[String:Any]] else{
                print("轉換錯誤")
                return
            }
            self.cities = city
            print("ios2~11以上")
        }
        
        for item in cities{
            print(item)
            print("===============")
        }
    }


}

