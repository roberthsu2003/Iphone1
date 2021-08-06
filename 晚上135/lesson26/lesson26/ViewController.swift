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
            print("下載完成")
        }
        
        downloadTask.resume()
    }


}

