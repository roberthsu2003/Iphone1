//
//  InfoViewController.swift
//  project16
//
//  Created by 徐國堂 on 2022/3/20.
//

import UIKit
struct YoubikeData:Codable{
    struct Site:Codable{
        let ar:String
        let bemp:Int
        let lat:Double
        let lng:Double
        let sbi:Int
        let sna:String
        let tot:Int
    }
    let data:[Site]
}

class InfoViewController: UITableViewController {
    @IBOutlet var progressView:UIProgressView!
    
    var sites = [YoubikeData.Site]()
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
        let jsonDecoder = JSONDecoder()
        guard let youbikeData = try? jsonDecoder.decode(YoubikeData.self, from: data) else{
            print("json無法解析")
            return
        }
        print(youbikeData)
        sites = youbikeData.data
        for site in sites{
            print(site.ar)
        }
    }
    
    func urlSession(_ session: URLSession,
                downloadTask: URLSessionDownloadTask,
                didWriteData bytesWritten: Int64,
           totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64){
        let percent = Float(bytesWritten / totalBytesWritten)
        progressView.progress = percent
        progressView.progressTintColor = UIColor.clear
    }
}
