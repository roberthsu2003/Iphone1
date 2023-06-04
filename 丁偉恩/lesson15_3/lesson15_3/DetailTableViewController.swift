//
//  DetailTableViewController.swift
//  lesson15_3
//
//  Created by 徐國堂 on 2023/6/4.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var area:String!
    lazy var urlSesssion:URLSession = {
        let config = URLSessionConfiguration.ephemeral
        config.allowsExpensiveNetworkAccess = true
        let mySession = URLSession(configuration: config, delegate:self, delegateQueue: OperationQueue.main)
        return mySession
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var urlComponets = URLComponents()
        urlComponets.scheme = "https"
        urlComponets.host = "youbike-json.onrender.com"
        urlComponets.path = "/youbike/" + area
        guard let url = urlComponets.url else{
            print("url編碼錯誤")
            return
        }
        let downloadTask = urlSesssion.downloadTask(with: url)
        downloadTask.resume()
    }

    

    

}

extension DetailTableViewController{
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

extension DetailTableViewController:URLSessionDelegate{
    
}
