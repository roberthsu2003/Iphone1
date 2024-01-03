//
//  dataSource.swift
//  lesson6_1
//
//  Created by 徐國堂 on 2024/1/3.
//

import UIKit
//全部使用type property,type method
//不需要init()

typealias YoubikeData = [Site]
struct Site:Codable {
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
    func startDownLoad()
    func finishDownLoad(data:YoubikeData)
    func failDownLoad(message:String)
}

class DataSource{
    static weak var delegate:DataSourceDelegate?
    static func startDownload(delegate:DataSourceDelegate){
        self.delegate = delegate
        self.delegate?.startDownLoad()
        let youbikeURL = URL(string: "https://youbike-json.onrender.com/youbike")
        let youbikeRequest = URLRequest(url:youbikeURL!, timeoutInterval: 120)
        let downloadTask = URLSession.shared.dataTask(with: youbikeRequest) { (data:Data?, response:URLResponse?, error:Error?) in
            guard error == nil else{
                print(error?.localizedDescription as Any)
                self.delegate?.failDownLoad(message: error!.localizedDescription)
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else{
                print("狀態不是200")
                self.delegate?.failDownLoad(message: "status Code不是200")
                return
            }
            
            guard let data = data else{
                print("沒有資料")
                self.delegate?.failDownLoad(message: "沒有資料")
                return
            }
            
            
            DispatchQueue.main.async {
                let jsonDecoder = JSONDecoder()
                guard let youbike = try? jsonDecoder.decode(YoubikeData.self, from: data) else{
                    print("無法解析錯誤")
                    self.delegate?.failDownLoad(message: "無法解析錯誤")
                    return
                }
                self.delegate?.finishDownLoad(data: youbike)
            }
           
        }
        
        downloadTask.resume()
    }
    private init(){
        
    }
}
