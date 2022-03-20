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
        let downloadTask = URLSession.shared.downloadTask(with: urlRequest)
    }


}

