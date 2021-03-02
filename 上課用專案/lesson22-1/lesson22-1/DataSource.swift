//
//  DataSource.swift
//  lesson22-1
//
//  Created by 徐國堂 on 2021/3/2.
//

import Foundation

class DataSource{
    //singleton class
    //建立type store property
    //property要實作closure的執行
    static let main:DataSource = {
        //這個closure的執行只會被執行一次
        print("closure 被執行了")
        return DataSource()
    }()
}
