//
//  DataSource.swift
//  2lesson19_2
//
//  Created by 徐國堂 on 2024/2/27.
//

import Foundation

class DataSource{
    static var main = DataSource()
    
    private init(){
        guard let sqliteURL = Bundle.main.url(forResource: "city0811", withExtension: "db") else{
            print("沒有這個city0811.db檔")
            return
        }
        //print(sqliteURL.path())
        
    }
}
