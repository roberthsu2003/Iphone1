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
        //修改UICollectionViewFlowLayout
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidth = self.collectionView.frame.width / 2 - 10
        layout.itemSize = CGSize(width: cellWidth, height: 150)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        
    }


}

extension ViewController:DataSourceDelegate{
    func finishDownLoad(data:Site){
        records = data.records
        //print("下載完成")
        //print(records)
        progressBar.isHidden = true
        collectionView.reloadData()
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
        cell.backgroundColor = .brown
        return cell
    }
}

