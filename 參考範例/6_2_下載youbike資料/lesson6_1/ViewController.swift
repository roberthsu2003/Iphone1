//
//  ViewController.swift
//  lesson6_1
//
//  Created by 徐國堂 on 2024/1/3.
//

import UIKit
class MyCell:UITableViewCell{ //要改變cell的背景色必需用override的方法
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var back = UIBackgroundConfiguration.listPlainCell().updated(for: state)
        
        if state.isSelected || state.isHighlighted{
           back.backgroundColor = .lightGray.withAlphaComponent(0.4)
        }else{
            back.backgroundColor = .lightGray.withAlphaComponent(0.2)
        }
        self.backgroundConfiguration = back
        
    }
     
}

class ViewController: UITableViewController {
    var cellID = "youbikeCell"
    var siteInfos:YoubikeData = YoubikeData() //先建立一個空的
    var indicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = .blue
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        DataSource.startDownload(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "台北市youbike資訊"
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)]
        )
        
        self.tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    @objc func handleRefreshControl(){
        //重新下載
        DataSource.startDownload(delegate: self)
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
}

extension ViewController:DataSourceDelegate{
    func startDownLoad(){
        print("開始下載")
        indicatorView.startAnimating()
    }
    
    func finishDownLoad(data:YoubikeData){
        siteInfos = data
        tableView.reloadData()
        indicatorView.stopAnimating()
        print("完成下載")
    }
    func failDownLoad(message:String){
        print("下載失敗")
        print(message)
        let alertController = UIAlertController(title: "網路連線有問題", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "確定", style: .default, handler: { _ in
            if self.indicatorView.isAnimating{
                self.indicatorView.stopAnimating()
            }
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下載資料", style: .plain, target: self, action: #selector(self.handleRefreshControl))
        }))
        
        self.present(alertController, animated: true)
    }
}
extension ViewController{
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int
    {
        return siteInfos.count
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyCell
        var configure = cell.defaultContentConfiguration()
        let site = siteInfos[indexPath.row]
        
        configure.text = site.sna
        configure.secondaryText = site.ar
        configure.textToSecondaryTextVerticalPadding = 10
        configure.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        cell.contentConfiguration = configure
        cell.accessoryType = .disclosureIndicator
        
           
        return cell
    }
    
    

}

