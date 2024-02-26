//
//  dataSource.swift
//  lesson6_1
//
//  Created by 徐國堂 on 2024/1/3.
//

import UIKit
//全部使用type property,type method
//不需要init()


struct Root:Codable {
    struct City:Codable{
        let cityId:Int
        let cityName:String
        let continent:String
        let country:String
        let image:String
    }
    let root:[City]
    
}
protocol DataSourceDelegate:AnyObject{
    func startDownLoad()
    func finishDownLoad(data:[Root.City])
    func failDownLoad(message:String)
}

class DataSource{
    static weak var delegate:DataSourceDelegate?
    static func startDownload(delegate:DataSourceDelegate){
        self.delegate = delegate
        self.delegate?.startDownLoad()
        let cityURL = URL(string: "https://webapi-2rhb.onrender.com/cities")
        let cityRequest = URLRequest(url:cityURL!, timeoutInterval: 120)
        let downloadTask = URLSession.shared.dataTask(with: cityRequest) { (data:Data?, response:URLResponse?, error:Error?) in
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
                guard let root = try? jsonDecoder.decode(Root.self, from: data) else{
                    print("無法解析錯誤")
                    self.delegate?.failDownLoad(message: "無法解析錯誤")
                    return
                }
                self.delegate?.finishDownLoad(data: root.root)
            }
           
        }
        
        downloadTask.resume()
    }
    private init(){
        
    }
}
