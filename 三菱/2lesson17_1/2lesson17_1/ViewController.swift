//
//  ViewController.swift
//  2lesson17_1
//
//  Created by 徐國堂 on 2024/2/20.
//

import UIKit

class ViewController: UITableViewController {
    var siteInfos:YoubikeData = YoubikeData()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        DataSource.startDownLoad(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "台北市youbike2.0及時資料"
        
    }


}

extension ViewController:DataSourceDelegate{
    func finishDownLoad(data:YoubikeData){
        siteInfos = data
        print(siteInfos)
    }
}

