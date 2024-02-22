//
//  DataSource.swift
//  2lesson18_2
//
//  Created by 徐國堂 on 2024/2/22.
//

import Foundation
class DataSource:NSObject{
    static var main = DataSource()
    
    private override init(){
        super.init()
        download()
    }
    
    func download(){
        let AQI_URL = "https://data.moenv.gov.tw/api/v2/aqx_p_488?api_key=e8dd42e6-9b8b-43f8-991e-b3dee723a52d&limit=1000&sort=datacreationdate%20desc&format=JSON"
        print(AQI_URL)
    }
}
