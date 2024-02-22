//
//  ViewController.swift
//  lesson6_1
//
//  Created by 徐國堂 on 2024/1/3.
//

import UIKit


class ViewController: UICollectionViewController{
    let progressBar = UIProgressView(progressViewStyle: .bar)
    let cellID = "CELL"
    var records = [Site.Records]()
    let refreshControl = UIRefreshControl()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let dataSource = DataSource.main
        dataSource.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "台灣目前空氣品質"
        collectionView.dataSource = self
        
        //建立collectionView的padding
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        //加入UIRefreshControl()
        //設定BounceVertical,為了UIRefreshControl
        collectionView.alwaysBounceVertical = true
        
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(doRefresh), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        
        //progressView的layout
        if let navigationVC = self.navigationController{
            navigationVC.navigationBar.addSubview(progressBar)
            progressBar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                progressBar.leadingAnchor.constraint(equalTo: navigationVC.navigationBar.leadingAnchor),
                progressBar.trailingAnchor.constraint(equalTo: navigationVC.navigationBar.trailingAnchor),
                progressBar.bottomAnchor.constraint(equalTo: navigationVC.navigationBar.bottomAnchor)
            ])
            progressBar.tintColor = UIColor.systemGreen
            progressBar.progress = 0
        }
        
        //建立UICollectionViewFlowLayout
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidth = self.collectionView.frame.width / 2 - 25 //除2,減左邊的contentInset:20和中間的最小距離5
        layout.itemSize = CGSize(width: cellWidth, height: 150)
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGray
        self.collectionView.backgroundView = backgroundView
    }
    @objc func doRefresh(){
        DataSource.main.download()
    }
}

extension ViewController:DataSourceDelegate{
    func PercentInProcess(percent:Double){
        progressBar.progress = Float(percent)
    }
    
    func finishDownLoad(data:Site){
        print(data)
        progressBar.isHidden = true
        self.records = data.records
        self.refreshControl.endRefreshing()
        self.collectionView.reloadData()
        
        print(self.records)
    }
    
    func failDownLoad(message:String){
        print(message)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        if cell.backgroundView ==  nil{ //全新的
            cell.backgroundColor = .red
            let v = UIView()
            v.backgroundColor = .systemTeal
            cell.backgroundView = v
            
            let selectedView = UIView()
            selectedView.backgroundColor = .white.withAlphaComponent(0.5)
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
            countyLabel.backgroundColor = .white.withAlphaComponent(0.7)
            countyLabel.textAlignment = .center
            
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
        //取出內容
        let record = records[indexPath.row]
        //建立county內容
        let countyLabel = cell.viewWithTag(1) as! UILabel
        countyLabel.text = "\(record.county) \(record.sitename)"
        
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

