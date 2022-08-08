//
//  ViewController.swift
//  lesson19
//
//  Created by 徐國堂 on 2022/8/8.
//

import UIKit

class ViewController: UIViewController {
    let httpString = "https://flask-robert.herokuapp.com/youbike/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: httpString) else{
            return
        }
        let downloadTask = URLSession.shared.downloadTask(with: url){
            (saveURL:URL?, response:URLResponse?, error:Error?) in
            guard let saveURL=saveURL,let response=response, error == nil else{
                print("下載失敗")
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else{
                print("下載狀態不是200")
                return
            }
            
            guard let data = try? Data(contentsOf: saveURL) else{
                print("下載的資料無法轉成Data")
                return
            }
            
            guard let jsonString = String(data: data, encoding: .utf8) else{
                print("資料轉成字串出錯了")
                return
            }
            
            DispatchQueue.main.async {
                print("下載成功")
                print(jsonString)
            }
            
        }
        downloadTask.resume()
        
    }


}

