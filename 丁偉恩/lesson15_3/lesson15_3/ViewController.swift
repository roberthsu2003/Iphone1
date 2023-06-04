//
//  ViewController.swift
//  lesson15_3
//
//  Created by 徐國堂 on 2023/6/4.
//

import UIKit

class ViewController: UITableViewController {
    var url = "https://youbike-json.onrender.com/youbike"
    var urlSession = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlRequest = URLRequest(url: URL(string: url)!)
        let downloadTask = urlSession.downloadTask(with: urlRequest) { (saveURL:URL?, response:URLResponse?, error:Error?) in
            guard let saveURL = saveURL, let response = response, error == nil else{
                print("下載失敗")
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else{
                print("狀態不是200")
                return
            }
            
            guard let data = try? Data(contentsOf: saveURL) else{
                print("下載完的資料沒有辦法轉出")
                return
            }
            print(data)
            let str = String(decoding: data, as: UTF8.self)
            
            print(str)
            
            
            
            
          
        }
        downloadTask.resume()
    }


}

