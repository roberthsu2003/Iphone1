//
//  ViewController.swift
//  2lesson16_1
//
//  Created by 徐國堂 on 2024/2/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let s = "https://www.apeth.net/matt/images/phoenixnewest.jpg"
        let url = URL(string: s)!
        let session = URLSession.shared
        let task = session.downloadTask(with: url) { (url:URL?, response:URLResponse?, error:Error?) in
            guard let url = url, let response = response , error == nil else{
                print("下載錯誤")
                return
            }
            print("下載成功")
        }
        
        task.resume()
        
    }


}

