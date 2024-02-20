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
        
        
    }


}

extension ViewController:DataSourceDelegate{
    func finishDownLoad(data:YoubikeData){
        siteInfos = data
        indicatorView.stopAnimating()
        print(siteInfos)
    }
    
    func startDownLoad(){
        indicatorView.startAnimating()
    }
    
    func failDownLoad(message:String){
        let alertController = UIAlertController(title: "網路下載有問題", message: message, preferredStyle: .alert)
        if self.indicatorView.isAnimating{
            self.indicatorView.stopAnimating()
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "重新下載", primaryAction: UIAction.init(handler: { _ in
            DataSource.startDownLoad(delegate: self)
        }))
        
        alertController.addAction(UIAlertAction.init(title: "確定", style: .default))
        
        self.present(alertController, animated: true)
    }
}

