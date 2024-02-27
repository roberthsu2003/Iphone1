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
    let cellId = "CELL"
    let refreshControl = UIRefreshControl()
    
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
        //設定collectionView的dataSoure
        collectionView.dataSource = self
        
        //建立collectionView的padding
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        //修改UICollectionViewFlowLayout
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidth = self.collectionView.frame.width / 2 - 30
        layout.itemSize = CGSize(width: cellWidth, height: 150)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        
        //UIRefreshControl()
        collectionView.alwaysBounceVertical = true
        refreshControl.tintColor = UIColor.systemTeal
        refreshControl.addTarget(self, action: #selector(doRefresh), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        
    }
    
    @objc func doRefresh(){
        DataSource.main.download()
    }


}

extension ViewController:DataSourceDelegate{
    func finishDownLoad(data:Site){
        records = data.records
        //print("下載完成")
        //print(records)
        progressBar.isHidden = true
        collectionView.reloadData()
        refreshControl.endRefreshing()
    }
    func failDownLoad(message:String){
        print("錯誤:\(message)")
    }
    func percentInProcess(percent:Double){
        progressBar.progress = Float(percent)
    }
}

extension ViewController{
    //UICollectionViewDataSource
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int{
        return records.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        if cell.backgroundView == nil{ //全新的,這裏負責layout
            let backgroundV = UIView()
            backgroundV.backgroundColor = UIColor.systemTeal
            cell.backgroundView = backgroundV
            
            let selectedView = UIView()
            selectedView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
            cell.selectedBackgroundView = selectedView
            
            //coutyLabel
            let countyLabel = UILabel()
            cell.contentView.addSubview(countyLabel)
            countyLabel.translatesAutoresizingMaskIntoConstraints = false
            countyLabel.tag = 1
            NSLayoutConstraint.activate([
                countyLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                countyLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                countyLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                countyLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
            countyLabel.textColor = .black
            countyLabel.highlightedTextColor = .systemTeal
            countyLabel.backgroundColor = UIColor.white.withAlphaComponent(0.7)
            countyLabel.textAlignment = .center
            countyLabel.font = UIFont.systemFont(ofSize: 14)
            
            //AQILabel
            let aqiLabel = UILabel()
            cell.contentView.addSubview(aqiLabel)
            aqiLabel.translatesAutoresizingMaskIntoConstraints = false
            aqiLabel.tag = 2
            NSLayoutConstraint.activate([
                aqiLabel.topAnchor.constraint(equalTo: countyLabel.bottomAnchor, constant: 20),
                aqiLabel.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
                aqiLabel.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10)
            ])
            aqiLabel.textColor = .white
            aqiLabel.textAlignment = .center
            aqiLabel.font = UIFont.systemFont(ofSize: 40)
            
            //statusLabel
            let statusLabel = UILabel()
            cell.contentView.addSubview(statusLabel)
            statusLabel.translatesAutoresizingMaskIntoConstraints = false
            statusLabel.tag = 3
            NSLayoutConstraint.activate([
                statusLabel.topAnchor.constraint(equalTo: countyLabel.bottomAnchor, constant: 10),
                statusLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10)
            ])
        }
        
        //已經有backgroundView,這裏負責改變內容
        let record = records[indexPath.row]
        let countyLabel = cell.viewWithTag(1) as! UILabel
        countyLabel.text = "\(record.county)-\(record.sitename)"
        
        //建立aqiLabel內容
        //AQI值0-50代表空氣品質良好(綠色)、51-100為普通(黃色)、101-150為對敏感族群不良(橘色)、151-200為對所有族群不良(紅色)、201-300為非常不良(紫色)、301-500為有害(褐紅)
        let aqiLabel = cell.viewWithTag(2) as! UILabel
        aqiLabel.text = record.aqi
        if let aqiValue = Int(record.aqi){ //有可能會是nil
            switch aqiValue{
            case 0...50:
                aqiLabel.textColor = .green
            case 51...100:
                aqiLabel.textColor = .yellow
            case 101...150:
                aqiLabel.textColor = .orange
            case 151...200:
                aqiLabel.textColor = .red
            case 201...300:
                aqiLabel.textColor = .purple
            default:
                aqiLabel.textColor = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
            }
            
        }
        
        //建立statusLabel內容
        let statusLabel = cell.viewWithTag(3) as! UILabel
        statusLabel.text = record.status
        
        
        return cell
    }
}

