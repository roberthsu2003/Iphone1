//
//  DetailViewController.swift
//  lesson19
//
//  Created by 徐國堂 on 2022/8/8.
//
struct YoubikeData:Codable{
    struct Site:Codable{
        let ar:String
        let bemp:Int
        let lat:Double
        let lng:Double
        let mday:String
        let sbi:Int
        let sna:String
        let tot:Int
    }
    let data:[Site]
}
import UIKit

class DetailViewController: UITableViewController {
    var area:String!
    lazy var urlSession:URLSession = {
        let config = URLSessionConfiguration.ephemeral
        config.allowsExpensiveNetworkAccess = true
        let urlSession = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        return urlSession
    }()
    var sites = [YoubikeData.Site]()
    
    override func awakeFromNib() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = area;
        var urlComponets = URLComponents()
        urlComponets.scheme = "https"
        urlComponets.host = "flask-robert.herokuapp.com"
        urlComponets.path = "/youbike/" + area
        guard let url = urlComponets.url else{
            print("url編碼錯誤")
            return
        }
        print(url.absoluteString)
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }

   

}

extension DetailViewController:URLSessionDownloadDelegate{
    func urlSession(_ session: URLSession,
       downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL){
        guard let data = try? Data(contentsOf: location) else{
            print("轉換為Data時出現問題")
            return
        }
        //print(String(data: data, encoding: .utf8))
        let jsonDecoder = JSONDecoder()
        guard let youbikeData = try? jsonDecoder.decode(YoubikeData.self, from: data)else{
            return
        }
        sites = youbikeData.data
        print(sites)
        tableView.reloadData()        
    }
}
