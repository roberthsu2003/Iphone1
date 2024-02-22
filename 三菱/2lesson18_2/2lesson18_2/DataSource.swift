//
//  DataSource.swift
//  2lesson18_2
//
//  Created by 徐國堂 on 2024/2/22.
//

import Foundation
struct Site:Codable{
    struct Record:Codable{
        let sitename:String
        let county:String
        let aqi:String
        let status:String
        let datacreationdate:String
        let longitude:String
        let latitude:String
    }
    let records:[Record]
}
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
        guard let data = try? Data(contentsOf: location) else{
            print("轉換Data失敗")
            return
        }
        
        let jsonDecoder = JSONDecoder()
        guard let aqiData = try? jsonDecoder.decode(Site.self, from: data) else{
            print("解析json失敗")
            return
        }
        
        print(aqiData)
        
    }
    
    func urlSession(
        _ session: URLSession,
        downloadTask: URLSessionDownloadTask,
        didWriteData bytesWritten: Int64,
        totalBytesWritten: Int64,
        totalBytesExpectedToWrite: Int64
    ){
        let percent = Double(totalBytesWritten) / Double(totalBytesWritten)
        print(percent)
    }
    
    func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        didCompleteWithError error: Error?
    ){
        guard error == nil else{
            print(error?.localizedDescription as Any)
            return
        }
    }
    
}
