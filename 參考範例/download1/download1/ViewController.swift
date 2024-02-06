//
//  ViewController.swift
//  download1
//
//  Created by 徐國堂 on 2021/3/28.
//使用URLSession並且使用URLSessionConfiguration
//使用download task
//使用下載完成的function(closure)
//使用Progress抓取進度
//下載有時會等20秒開始,web server的關係。

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cityImageView:UIImageView!
    @IBOutlet var progressView:UIProgressView!
    var task:URLSessionTask!
    
    lazy var session:URLSession = {
        let config = URLSessionConfiguration.ephemeral
        config.allowsCellularAccess = true
        config.allowsExpensiveNetworkAccess = true
        let session = URLSession(configuration: config)
        return session
    }()
    
    var ob:NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doElaborateHTTP(_ sender:Any){
        
        self.cityImageView.image = nil
        let pathString = "https://flask-robert.herokuapp.com/static/cityImage/Akihabara.jpg"
        let url = URL(string: pathString)!
        let request = URLRequest(url: url)
        let task = self.session.downloadTask(with: request) { (url:URL?, response:URLResponse?, error:Error?) in
            
            guard let url = url, let response = response, error == nil else{
                print("下載出現問題")
                return
            }
            
            print("下載完成")
            
            let status = (response as! HTTPURLResponse).statusCode
            if status != 200{
                print("下載失敗")
            }
            
            if let data = try? Data(contentsOf: url){
                let cityImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self.cityImageView.image = cityImage
                    self.progressView.progress = 0
                }
            }
            
        }
        //progress的fractionCompleted是key value
        //透過progress.observe來註冊觀察fractionCompleted
        //\.fractionCompleted 是keypath的語法
        //傳出的NSKeyValueObservation必需一定要是store property,不然下載失敗
        self.ob = task.progress.observe(\.fractionCompleted) { (prog:Progress, change:NSKeyValueObservedChange<Double>) in
            print("downloaded\(Int(100*prog.fractionCompleted))%")
            DispatchQueue.main.async {
                self.progressView.progress = Float(prog.fractionCompleted)
            }
            
        }
        
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

