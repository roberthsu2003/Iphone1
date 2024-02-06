//
//  ViewController.swift
//  download1
//
//  Created by 徐國堂 on 2021/3/28.
//使用URLSession並且使用URLSessionConfiguration
//使用download task
//使用URLSession delegate方式下載
//下載有時會等20秒開始,web server的關係。

import UIKit

class ViewController1: UIViewController {
    @IBOutlet var cityImageView:UIImageView!
    var task:URLSessionTask!
    
    lazy var session:URLSession = {
        let config = URLSessionConfiguration.ephemeral
        config.allowsCellularAccess = true
        config.allowsExpensiveNetworkAccess = true
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        return session
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doElaborateHTTP(_ sender:Any){
        
        self.cityImageView.image = nil
        let pathString = "https://flask-robert.herokuapp.com/static/cityImage/Akihabara.jpg"
        let url = URL(string: pathString)!
        let request = NSMutableURLRequest(url: url)
        URLProtocol.setProperty("Hello", forKey: "greeting", in: request)
        //NSMutableURLRequest和NSURLRequest是bridge,要轉型
        self.task = self.session.downloadTask(with: request as URLRequest)
        
        task.resume()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //結束session所有任務
        self.session.finishTasksAndInvalidate()
    }
    
    deinit{
        //ViewController被消滅
        print("再見")
    }

}

extension ViewController1:URLSessionDownloadDelegate{
    
    func urlSession(_ session: URLSession,
                downloadTask: URLSessionDownloadTask,
                didWriteData bytesWritten: Int64,
           totalBytesWritten: Int64,
           totalBytesExpectedToWrite: Int64){
        //下載進度
        
        print("downloaded:\(100*totalBytesWritten/totalBytesExpectedToWrite) %")
    }
    
    func urlSession(_ session: URLSession,
                        task: URLSessionTask,
                        didCompleteWithError error: Error?){
        //下載失敗,定義於URLSessionTaskDelegate
        self.task = nil
    }
    
    func urlSession(_ session: URLSession,
       downloadTask: URLSessionDownloadTask,
       didFinishDownloadingTo location: URL){
        //下載完成
        
        let req = downloadTask.originalRequest!
        if let greeting = URLProtocol.property(forKey: "greeting", in: req) as? String{
            print(greeting)
        }
        self.task = nil
        let status = (downloadTask.response as? HTTPURLResponse)?.statusCode
        print("response status:\(status!)")
        guard status == 200 else{
            print("\(status!)")
            return
        }
        
        if let data = try? Data(contentsOf: location) {
            let im = UIImage(data: data)
            self.cityImageView.image = im
        }
        
        
    }
    
    
    
    
}


