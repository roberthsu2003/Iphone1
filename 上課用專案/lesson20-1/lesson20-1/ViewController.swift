//
//  ViewController.swift
//  lesson20-1
//
//  Created by 徐國堂 on 2021/2/23.
//

import UIKit

class ViewController: UICollectionViewController {
    var citys = [City]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")
        
        guard let dicCitys = NSArray(contentsOf: pathURL!) as? [[String:Any]] else{
            print("解析錯誤")
            return
        }
        
        for cityDic in dicCitys{
            let city = City()
            city.city = cityDic["City"] as? String
            city.country = cityDic["Country"] as? String;
            city.continent = cityDic["Continent"] as? String;
            city.image = cityDic["Image"] as? String;
            city.local = cityDic["Local"] as? String;
            city.url = cityDic["url"] as? String;
            city.latitude = cityDic["lat"] as? Double;
            city.longitude = cityDic["long"] as? Double;
            citys.append(city)
        }
        print(citys)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

