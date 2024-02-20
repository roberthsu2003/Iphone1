//
//  ViewController.swift
//  2lesson17_1
//
//  Created by 徐國堂 on 2024/2/20.
//

import UIKit

class ViewController: UITableViewController {
    var siteInfos:YoubikeData = YoubikeData()
    var indicatorView:UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = .blue
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        DataSource.startDownLoad(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "台北市youbike2.0及時資料"
        //加入indicatorView
        tableView.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor, constant: -100)
        ])
        indicatorView.startAnimating()
        
    }


}

extension ViewController:DataSourceDelegate{
    func finishDownLoad(data:YoubikeData){
        siteInfos = data
        print(siteInfos)
    }
}

