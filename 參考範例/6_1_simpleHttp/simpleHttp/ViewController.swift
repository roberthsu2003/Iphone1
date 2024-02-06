//
//  ViewController.swift
//  simpleHttp
//
//  Created by 徐國堂 on 2024/2/6.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var progress:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doSimpleHTTP(_ sender:Any){
        self.imageView.image = nil
        let s = "https://www.apeth.net/matt/images/phoenixnewest.jpg"
        let url = URL(string: s)!
        let session = URLSession.shared
        let task = session.downloadTask(with: URLRequest.init(url: url)) { (url:URL?, response:URLResponse?, error:Error?) in
            //下載完畢執行的程式區塊
            guard let url=url, let resp = response, error == nil else{
                print("下載失敗")
                return
            }
            let status = (resp as! HTTPURLResponse).statusCode
            guard status == 200 else{
                print("下載有錯誤訊息")
                return
            }
            
            guard let imageData = try? Data(contentsOf: url) else{
                print("轉換資料失敗")
                return
            }
            let image = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
            
        }
        
        if #available(iOS 11.0, *){
            self.progress.observedProgress = task.progress
        }
        
        DispatchQueue.global(qos: .background).async {
            task.resume()
        }
    }


}

