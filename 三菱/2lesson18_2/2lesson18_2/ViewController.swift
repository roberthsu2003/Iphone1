//
//  ViewController.swift
//  2lesson18_2
//
//  Created by 徐國堂 on 2024/2/22.
//

import UIKit

class ViewController: UICollectionViewController {
    var records = [Site.Record]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource = DataSource.main
        dataSource.delegate = self
        
    }


}

extension ViewController:DataSourceDelegate{
    func finishDownLoad(data:Site){
        records = data.records
        print("下載完成")
        print(records)
    }
    func failDownLoad(message:String){
        print("錯誤:\(message)")
    }
    func percentInProcess(percent:Double){
        print("進度:\(percent)")
    }
}

