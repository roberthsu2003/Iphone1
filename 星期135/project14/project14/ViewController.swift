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
        print("ViewController")
    }


}

