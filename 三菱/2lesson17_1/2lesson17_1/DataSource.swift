//
//  DataSource.swift
//  2lesson17_1
//
//  Created by 徐國堂 on 2024/2/20.
//

import Foundation
typealias YoubikeData = [Site]

struct Site:Codable{
    let ar:String
    let bemp:Int
    let lat:Double
    let lng:Double
    let mday:String
    let sbi:Int
    let sna:String
    let tot:Int
}
protocol DataSourceDelegate:AnyObject{
    func finishDownLoad(data:YoubikeData)
    func startDownLoad()
}

class DataSource{
    static var session:URLSession?
    weak static var delegate:DataSourceDelegate?
    
    static func startDownLoad(delegate:DataSourceDelegate){
        self.delegate = delegate
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
                let jsonDecoder = JSONDecoder()
                guard let youbike = try?jsonDecoder.decode( YoubikeData.self, from: data) else{
                    print("無法解析")
                    return
                }
                
                self.delegate?.finishDownLoad(data: youbike)
               
            }
            
            //
        }){
            dataTask.resume()
            self.delegate?.startDownLoad()
        }
        
    }
    
    private init(){
        
    }
}
