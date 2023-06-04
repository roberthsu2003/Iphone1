//
//  DetailTableViewController.swift
//  lesson15_3
//
//  Created by 徐國堂 on 2023/6/4.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var area:String!
    var sites = [Site]()
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

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        let site = sites[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
       
        cell.textLabel!.text = site.sna
           
       return cell
    }
}

extension DetailTableViewController:URLSessionDownloadDelegate{
    func urlSession(
        _ session: URLSession,
        downloadTask: URLSessionDownloadTask,
        didFinishDownloadingTo location: URL
    ){
        guard let data = try? Data(contentsOf: location) else{
            print("轉換資料有問題")
            return
        }
        
        let jsonDecoder = JSONDecoder()
        guard let youbikeData = try? jsonDecoder.decode([Site].self, from: data) else{
            print("json無法解析")
            return
        }
        sites = youbikeData
        tableView.reloadData()
    }
}
