import UIKit

typealias DownloaderCH = (URL?) -> ()

class Downloader:NSObject{
    let config:URLSessionConfiguration
    lazy var session:URLSession = {
        return URLSession(configuration: self.config, delegate: DownloaderDelegate(), delegateQueue: .main)
    }()
    init(configuration config:URLSessionConfiguration){
        self.config = config
        super.init()
        print("printing on main thread")
    }
    
    func download(url:URL, completionHandler ch:@escaping DownloaderCH){
        let task = self.session.downloadTask(with: url)
        let del = self.session.delegate as! DownloaderDelegate
        del.appendHandler(ch, task: task)
        task.resume()
    }
    
    private class DownloaderDelegate:NSObject,URLSessionDownloadDelegate{
        var handlers = [Int:DownloaderCH]()
        func appendHandler(_ ch:@escaping DownloaderCH, task:URLSessionTask){
            print("加入下載任務id\(task.taskIdentifier)")
            self.handlers[task.taskIdentifier] = ch
        }
        
        func urlSession(_ session: URLSession,
           downloadTask: URLSessionDownloadTask,
           didFinishDownloadingTo location: URL){
            print("完成下載任務id\(downloadTask.taskIdentifier)")
            let ch = self.handlers[downloadTask.taskIdentifier]
            ch?(location)
        }
    }
}
