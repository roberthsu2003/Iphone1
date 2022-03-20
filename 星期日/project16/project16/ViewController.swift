//
//  ViewController.swift
//  project16
//
//  Created by 徐國堂 on 2022/3/20.
//

import UIKit

class ViewController: UIViewController {
    let areaHttpString = "https://flask-robert.herokuapp.com/youbike/"

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: areaHttpString) else{
            return
        }
        
        let urlRequest = URLRequest(url: url)
               
        let downloadTask = URLSession.shared.downloadTask(with: urlRequest) { (saveURL:URL?, response:URLResponse?, error:Error?) in
            guard let saveURL = saveURL, let response = response, error == nil else{
                print("下載失敗")
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else {
                 print("網站有異常")
                 return
            }
            
            guard let data = try? Data(contentsOf: saveURL) else{
                print("下載資料Data有誤")
                return
            }
            guard let downloadString = String(data: data, encoding: .utf8) else{
                print("轉換資料有錯")
                return
            }
            print(downloadString)
        }
        downloadTask.resume()
        
    }


}

