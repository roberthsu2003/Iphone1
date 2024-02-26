//
//  Downloader.swift
//  lesson6_4
//
//  Created by 徐國堂 on 2024/2/26.
//

import UIKit


typealias DownloaderCH = (URL?) -> ()

class Downloader:NSObject{
    let config:URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsExpensiveNetworkAccess = true
        config.urlCache = nil
        config.timeoutIntervalForRequest = 180
        return config
    }()
    let queue:OperationQueue = {
        let q = OperationQueue()
        q.maxConcurrentOperationCount = 1
        return q
    }()
    
    lazy var session:URLSession = URLSession(configuration: self.config, delegate: DownloaderDelegate(), delegateQueue: self.queue)
    
    override init(){
        super.init()
        print("printing on main thread")
    }
    
    func download(url:URL, completionHandler ch:@escaping DownloaderCH) -> URLSessionTask{
        let task = self.session.downloadTask(with: URLRequest.init(url: url, timeoutInterval: 180))
        let delegate = self.session.delegate as! DownloaderDelegate
        self.session.delegateQueue.addOperation {
            delegate.appendHandler(ch, task: task)
        }
        task.resume()
        return task
    }
    
    deinit{
        self.session.invalidateAndCancel()
    }
    
    //巢狀類別
    private class DownloaderDelegate:NSObject,URLSessionDownloadDelegate{
        private var handlers = [Int:DownloaderCH]()
        
        func appendHandler(_ ch:@escaping DownloaderCH, task:URLSessionTask){
            print("加入一個任務\(task.taskIdentifier)")
            self.handlers[task.taskIdentifier] = ch
        }
        
        func urlSession(
            _ session: URLSession,
            downloadTask: URLSessionDownloadTask,
            didFinishDownloadingTo location: URL
        ){
            print("完成下載任務:\(downloadTask.taskIdentifier)")
            let ch = self.handlers[downloadTask.taskIdentifier]
            DispatchQueue.main.async {
                ch?(location)
            }
        }
        
        func urlSession(
            _ session: URLSession,
            task: URLSessionTask,
            didCompleteWithError error: Error?
        ){
            print("移除完成的下載任務:\(task.taskIdentifier)")
            let ch = self.handlers[task.taskIdentifier]
            self.handlers[task.taskIdentifier] = nil
            if let error = error{
                print("發生錯誤:",error.localizedDescription)
                DispatchQueue.main.sync{
                    ch?(nil)
                }
            }
        }
    }
    
}
