//
//  ViewController.swift
//  project6
//
//  Created by 徐國堂 on 2022/1/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        /*
        //optional binding
        if let pathURL = bundle.url(forResource: "city", withExtension: "plist"){
            print("有這個檔")
        }else{
            print("沒有這個檔")
        }
         */
        guard let pathURL = bundle.url(forResource: "city", withExtension: "plist") else{
            //false程式區塊
            print("出錯了!沒有這個檔")
            return
        }
        /*
        guard let city = NSArray(contentsOf: pathURL) as? [String] else{
            print("轉換錯誤")
            return
        }
        for item in city{
            print(item)
        }
         */
        
        
        
        if #available(iOS 11.0, *){
            guard let city = try! NSArray(contentsOf: pathURL, error: ()) as? [String] else{
                print("轉換錯誤")
                return
            }
            for item in city{
                print(item)
            }
            print("ios11以上")
        }else{
            guard let city = NSArray(contentsOf: pathURL) as? [String] else{
                print("轉換錯誤")
                return
            }
            for item in city{
                print(item)
            }
            print("ios2~11以上")
        }
        
        
        
        
        
        
        
    }


}

