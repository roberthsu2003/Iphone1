//
//  ViewController.swift
//  lesson26
//
//  Created by 徐國堂 on 2021/8/6.
//

import UIKit

class ViewController: UIViewController {
    let areasHttpString = "https://flask-robert.herokuapp.com/youbike/"

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: areasHttpString)else{
            print("url出問題")
            return
        }
        let downloadTask = URLSession.shared.downloadTask(with: URLRequest(url: url)) { (saveURL:URL?, response:URLResponse?, error:Error?) in
            guard let saveURL = saveURL, let response = response, error == nil else{
               print("下載錯誤")
               return;
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else{
                print("狀態不是200")
                return
            }
            
            guard let data = try? Data(contentsOf: saveURL)else{
                print("下載資料無法轉成Data")
                return
            }
            
            let str = String(decoding: data, as: UTF8.self)
            print(str)
            
            
            
        }
        
        downloadTask.resume()
    }


}

