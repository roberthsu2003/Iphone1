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

}




