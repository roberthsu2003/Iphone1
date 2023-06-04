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
        let downloadTask = urlSession.downloadTask(with: urlRequest) { (saveURL:URL?, response:URLResponse?, erro:Error?) in
            
        }
    }


}

