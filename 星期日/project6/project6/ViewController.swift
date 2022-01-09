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
        
        print(pathURL.absoluteString)
        
        
        
        
    }


}

