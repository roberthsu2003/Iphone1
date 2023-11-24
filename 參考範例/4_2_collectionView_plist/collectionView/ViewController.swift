//
//  ViewController.swift
//  collectionView
//
//  Created by 徐國堂 on 2023/11/24.
//

import UIKit

class ViewController: UICollectionViewController {
    private  lazy var sections:[[String:Any]] = {
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            return [[String:Any]]()
        }
        do{
            let data = try Data(contentsOf: pathURL)
            guard let sections = try PropertyListSerialization.propertyList(from: data, format: nil) as? [[String:Any]] else{
                return [[String:Any]]()
            }
            return sections
        }catch{
            print("讀取檔案錯誤",error)
        }
        return [[String:Any]]()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let flowlayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowlayout.itemSize = CGSize(width: self.collectionView.bounds.width, height: 120)
        }
    }
}

extension ViewController{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myItem", for: indexPath)
        let index = indexPath.item
        let imageName = sections[index]["Image"] as! String
        let imageView = UIImageView(image: UIImage(named: imageName)!)
        imageView.contentMode = .scaleAspectFill
        imageView.tag = 1 //不可以是0
        if cell.contentView.viewWithTag(1) == nil{
            cell.backgroundColor = .brown
            cell.contentView.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
            ])
        }else{
            let oldImageView = cell.contentView.viewWithTag(1) as! UIImageView
            oldImageView.image = UIImage(named: imageName)!
        }
        
        return cell
        
    }
}

