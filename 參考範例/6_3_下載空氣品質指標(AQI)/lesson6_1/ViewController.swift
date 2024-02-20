//
//  ViewController.swift
//  lesson6_1
//
//  Created by 徐國堂 on 2024/1/3.
//

import UIKit


class ViewController: UICollectionViewController{
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let dataSource = DataSource.main
        dataSource.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController:DataSourceDelegate{
    func PercentInProcess(percent:Double){
        print(percent)
    }
    
    func finishDownLoad(data:Site){
        print(data)
    }
    
    func failDownLoad(message:String){
        print(message)
    }
}

