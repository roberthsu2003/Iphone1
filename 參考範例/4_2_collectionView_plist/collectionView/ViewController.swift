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
        //取出值
        let imageName = sections[index]["Image"] as! String
        let continent = sections[index]["Continent"] as! String
        let city = sections[index]["City"] as! String
        let country = sections[index]["Country"] as! String
        if cell.contentView.viewWithTag(1) == nil{
            //加入背景
            let imageView = UIImageView(image: UIImage(named: imageName)!)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.tag = 1 //不可以是0
            cell.backgroundColor = .brown
            cell.contentView.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
            ])
            //加入stackView
            let stackview = UIStackView()
            stackview.translatesAutoresizingMaskIntoConstraints = false
            stackview.axis = .vertical
            stackview.spacing = 0
            stackview.alignment = .center
            stackview.distribution = .equalSpacing
            stackview.backgroundColor = UIColor(white: 1, alpha: 0.7)
            cell.contentView.addSubview(stackview)
            NSLayoutConstraint.activate([
                stackview.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                stackview.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
                stackview.widthAnchor.constraint(greaterThanOrEqualToConstant: 150)
            ])
            let cityLabel = UILabel()
            cityLabel.text = city
            cityLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            cityLabel.tag = 2
            cityLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
            stackview.addArrangedSubview(cityLabel)
            
            let countryLabel = UILabel()
            countryLabel.text = country
            countryLabel.tag = 3
            stackview.addArrangedSubview(countryLabel)
            
            let continentLabel = UILabel()
            continentLabel.text = continent
            continentLabel.tag = 4
            stackview.addArrangedSubview(continentLabel)
            
        }else{
            let oldImageView = cell.contentView.viewWithTag(1) as! UIImageView
            oldImageView.image = UIImage(named: imageName)!
            let oldCityLabel = cell.contentView.viewWithTag(2) as! UILabel
            oldCityLabel.text = city
            
            let oldCountryLabel = cell.contentView.viewWithTag(3) as! UILabel
            oldCountryLabel.text = country
            
            let oldContinentLabel = cell.contentView.viewWithTag(4) as! UILabel
            oldContinentLabel.text = continent
        }
        
        return cell
        
    }
}

