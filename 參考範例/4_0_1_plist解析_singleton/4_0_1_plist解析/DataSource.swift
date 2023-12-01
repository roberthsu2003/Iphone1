//
//  DataSource.swift
//  4_0_1_plist解析
//
//  Created by 徐國堂 on 2023/12/1.
//singleton class的使用

import Foundation
class DataSource{
    //singleton class
    static var main = DataSource.init();
    var cities:[[String:Any]]
    
    private init?(){
        guard let urlPath = Bundle.main.url(forResource: "citylist", withExtension: "plist") else{
            return nil
        }        
        do{
            let data = try Data(contentsOf: urlPath)
            if let cities = try PropertyListSerialization.propertyList(from: data, format: nil) as? [[String:Any]]{
                self.cities =  cities
            }else{
                return nil
            }
        }catch{
            print("檔案讀取錯誤")
            return nil
        }
    }
}
