//
//  ViewController.swift
//  2lesson18_2
//
//  Created by 徐國堂 on 2024/2/22.
//

import UIKit

class ViewController: UICollectionViewController {
    var records = [Site.Record]() //必需要是空的
    let progressBar = UIProgressView(progressViewStyle: .bar)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let dataSource = DataSource.main
        dataSource.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //加入progressView
        if let navigationVC = self.navigationController{
            navigationVC.navigationBar.addSubview(progressBar)
            progressBar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                progressBar.leadingAnchor.constraint(equalTo: navigationVC.navigationBar.leadingAnchor),
                progressBar.trailingAnchor.constraint(equalTo: navigationVC.navigationBar.trailingAnchor),
                progressBar.bottomAnchor.constraint(equalTo: navigationVC.navigationBar.bottomAnchor)
            ])
            progressBar.tintColor = UIColor.systemBlue
            progressBar.progress = 0
        }
        
        
    }


}

extension ViewController:DataSourceDelegate{
    func finishDownLoad(data:Site){
        records = data.records
        //print("下載完成")
        //print(records)
        progressBar.isHidden = true
    }
    func failDownLoad(message:String){
        print("錯誤:\(message)")
    }
    func percentInProcess(percent:Double){
        progressBar.progress = Float(percent)
    }
}

