//
//  dataSource1.swift
//  lesson6_3
//
//  Created by 徐國堂 on 2024/2/20.
//

import Foundation
struct Site:Codable{
    struct Records:Codable{
        let sitename:String
        let county:String
        let aqi:String
        let status:String
        let datacreationdate:String
        let longitude:String
        let latitude:String
    }
    let records:[Records]
}
protocol DataSourceDelegate:AnyObject{
    func PercentInProcess(percent:Double)
    func finishDownLoad(data:Site)
    func failDownLoad(message:String)
}

class DataSource:NSObject{
    var urlSession:URLSession!
    weak var delegate:DataSourceDelegate?
    static var main:DataSource = DataSource()
    
    private override init(){
        super.init()
        download()
    }
    
    func download(){
        let AQI_URL = URL(string: "https://data.moenv.gov.tw/api/v2/aqx_p_488?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&limit=1000&sort=datacreationdate desc&format=JSON")
        
        let AQI_URLRequest = URLRequest(url: AQI_URL!)
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 180
        
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
            self.delegate?.failDownLoad(message: "轉換Data失敗")
            return
        }
        let jsonDecoder = JSONDecoder()
        guard let aqiData = try? jsonDecoder.decode(Site.self, from: data) else{
            self.delegate?.failDownLoad(message: "解析json失敗")
            return
        }
        self.delegate?.finishDownLoad(data: aqiData)
        
        
    }
    
    func urlSession(
        _ session: URLSession,
        downloadTask: URLSessionDownloadTask,
        didWriteData bytesWritten: Int64,
        totalBytesWritten: Int64,
        totalBytesExpectedToWrite: Int64
    ){
        let percent = Double(totalBytesWritten) / Double(totalBytesWritten)
        self.delegate?.PercentInProcess(percent: percent)
    }
    
    func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        didCompleteWithError error: Error?
    ){
        guard error == nil else{
            self.delegate?.failDownLoad(message: "下載失敗")
            return
        }
    }
}
