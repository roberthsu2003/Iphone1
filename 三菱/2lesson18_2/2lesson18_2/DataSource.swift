//
//  DataSource.swift
//  2lesson18_2
//
//  Created by 徐國堂 on 2024/2/22.
//

import Foundation
class DataSource:NSObject{
    static var main = DataSource()
    var urlSession:URLSession!
    
    private override init(){
        super.init()
        download()
    }
    
    func download(){
        guard let AQI_URL = URL(string: "https://data.moenv.gov.tw/api/v2/aqx_p_488?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&limit=1000&sort=datacreationdate%20desc&format=JSON") else{
            print("url有錯誤")
            return
        }
        let AQI_URLRequest = URLRequest(url: AQI_URL)
        let configuration = URLSessionConfiguration.default
        configuration.allowsExpensiveNetworkAccess = true
        configuration.timeoutIntervalForRequest = 120
        urlSession = URLSession(configuration: configuration, delegate: self as URLSessionDownloadDelegate, delegateQueue: OperationQueue.main)
        let downloadTask = urlSession.downloadTask(with: AQI_URLRequest)
        downloadTask.resume()
    }
}

extension DataSource:URLSessionDownloadDelegate{
    func urlSession(
        _ session: URLSession,
        downloadTask: URLSessionDownloadTask,
        didFinishDownloadingTo location: URL
    ){
        print("下載完成\(location)")
    }
    
    
}
