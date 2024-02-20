//
//  DataSource.swift
//  2lesson17_1
//
//  Created by 徐國堂 on 2024/2/20.
//

import Foundation

class DataSource{
    static var session:URLSession?
    
    static func startDownLoad(){
        let youbike = "https://youbike-json.onrender.com/youbike"
        let configuration = URLSessionConfiguration.default
        configuration.allowsExpensiveNetworkAccess = true
        configuration.timeoutIntervalForRequest = 180
        session = URLSession(configuration: configuration)
        let youbikeURL = URL(string: youbike)!
        let youbikeRequest = URLRequest(url: youbikeURL, timeoutInterval: 180)
        if let dataTask = session?.dataTask(with: youbikeRequest, completionHandler: { (data:Data?, response:URLResponse?, error:Error?)in
            guard error == nil else{
                print(error?.localizedDescription as Any)
                return
            }
            guard (response as! HTTPURLResponse).statusCode == 200 else{
                print("status code出錯")
                return
            }
            
            guard let data = data else{
                print("沒有資料")
                return
            }
            DispatchQueue.main.async {
                //跳回主執行緒
                print(data)
               print(NSString(data: data, encoding: 1))
            }
            
            //
        }){
            dataTask.resume()
        }
        
    }
    
    private init(){
        
    }
}
