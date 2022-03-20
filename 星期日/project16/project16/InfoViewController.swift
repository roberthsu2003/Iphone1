//
//  InfoViewController.swift
//  project16
//
//  Created by 徐國堂 on 2022/3/20.
//

import UIKit

class InfoViewController: UITableViewController {
    var area:String!
    lazy var urlSession:URLSession = {
        let config = URLSessionConfiguration.ephemeral
        config.allowsExpensiveNetworkAccess = true
        let mySession = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        return mySession
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = area
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "flask-robert.herokuapp.com"
        urlComponents.path = "/youbike/" + area
        guard let url = urlComponents.url else{
            print("url編碼錯誤")
            return
        }
        print(url.absoluteString)
    }


}

extension InfoViewController:URLSessionDelegate{
    
}
