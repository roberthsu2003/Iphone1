//
//  ViewController.swift
//  2lesson16_1
//
//  Created by 徐國堂 on 2024/2/6.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var progress:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func doSimpleHTTP(_ sender:UIButton){
        self.imageView.image = nil
        let s = "https://www.apeth.net/matt/images/phoenixnewest.jpg"
        let url = URL(string: s)!
        let session = URLSession.shared
        let task = session.downloadTask(with: url) { (url:URL?, response:URLResponse?, error:Error?) in
            guard let url = url, let response = response , error == nil else{
                print("下載錯誤")
                return
            }
            let status = (response as! HTTPURLResponse).statusCode
            guard status == 200 else{
                print("下載成功但有錯誤訊息")
                return
            }
            
            guard let imageData = try? Data(contentsOf: url) else{
                print("資料無法轉換")
                return
            }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
        progress.observedProgress = task.progress
        
        DispatchQueue.global(qos: .background).async {
            task.resume()
        }
        
    }


}

