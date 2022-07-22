//
//  ViewController.swift
//  project14
//
//  Created by 徐國堂 on 2022/7/18.
//

import UIKit

class ViewController: UICollectionViewController {
    var cities = [City]()
    
    override func awakeFromNib() {
        let bundle = Bundle.main;
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            return
        }
        let nsArray = try? NSArray(contentsOf: pathURL, error: ())
        if let array = nsArray as? [[String:Any]]{
            for cityDic in array{
                let city = City()
                city.country = cityDic["Country"] as? String ?? ""
                city.continent = cityDic["Continent"] as? String ?? ""
                city.image = cityDic["Image"] as? String ?? ""
                city.local = cityDic["Local"] as? String ?? ""
                city.url = cityDic["url"] as? String ?? ""
                city.latitude = cityDic["lat"] as? Double ?? 0.0
                city.longitude = cityDic["long"] as? Double ?? 0.0
                cities.append(city)
            }
        }
        
        print(cities)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 180, height: 120)
    }


}

extension ViewController{
    //UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return cities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let city = cities[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
        if cell.backgroundView == nil{
            let bv = UIView(frame: cell.bounds)
            bv.contentMode = .scaleToFill
            bv.backgroundColor = UIColor.lightGray
            cell.backgroundView = bv
            
            let selectionView = UIView(frame: cell.bounds)
            selectionView.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
            cell.selectedBackgroundView = selectionView
            
            let cityImageView = UIImageView(frame: cell.bounds)
            cityImageView.tag = 1
            cityImageView.contentMode = .scaleAspectFill
            cell.contentView.addSubview(cityImageView)
            cityImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                cityImageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                
                cityImageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10),
                
                cityImageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 0),
                
                cityImageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 0)
            ])
        }
        
        let cityImageView = cell.viewWithTag(1) as! UIImageView
        cityImageView.image = UIImage(named: city.image)
        return cell
    }
}


extension ViewController{
    //UICollectionViewDataDelegate
    
}

