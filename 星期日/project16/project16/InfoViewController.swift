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
        
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
        
    }


}

extension InfoViewController:URLSessionDownloadDelegate{
    func urlSession(_ session: URLSession,
       downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL){
        guard let data = try? Data(contentsOf: location) else{
            print("轉換為Data資料有問題")
            return
        }
        print(String(data: data, encoding: .utf8))
    }
}
