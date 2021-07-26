//
//  ViewController.swift
//  lesson13_2
//
//  Created by 徐國堂 on 2021/7/7.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView:UICollectionView!
   
    var cities:[City]={
        if let plistURL = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
            if let array = NSArray(contentsOf: plistURL) as? [[String:Any]]{
                var citys = [City]()
                for cityDic in array{
                    let city = City()
                    city.city = cityDic["City"] as? String
                    city.country = cityDic["Country"] as? String
                    city.continent = cityDic["Continent"] as? String
                    city.image = cityDic["Image"] as? String
                    city.local = cityDic["Local"] as? String
                    city.url = cityDic["url"] as? String
                    city.latitude = cityDic["lat"] as? Double
                    city.longitude = cityDic["long"] as? Double
                    citys.append(city)
                }
                return citys
            }
        }
        
        return [City]()
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self;
        collectionView.delegate = self;
    }

}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let city = cities[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! CollectionViewCell
        cell.cityLabel.text = city.city
        cell.imageView.image = UIImage(named: city.image)
        return cell
    }
}

extension ViewController:UICollectionViewDelegate{
    
}




