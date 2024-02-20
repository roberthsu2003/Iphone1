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
    }
    
    private init(){
        
    }
}
