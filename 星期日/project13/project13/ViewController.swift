//
//  ViewController.swift
//  project13
//
//  Created by 徐國堂 on 2022/2/27.
//

import UIKit

class ViewController:UICollectionViewController{
    var citys = [City]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let mainbundle = Bundle.main
        let pathURL = mainbundle.url(forResource: "citylist", withExtension: "plist")!
        guard let dicCitys = try! NSArray(contentsOf: pathURL, error: ()) as? [[String:Any]] else{
            return
        }
        for dicCity in dicCitys{
            let cityname = dicCity["City"] as! String
            let country = dicCity["Country"] as! String
            let continent = dicCity["Continent"] as! String
            let image = dicCity["Image"] as! String
            let local = dicCity["Local"] as! String
            let url = dicCity["url"] as! String
            let latitude = dicCity["lat"] as! Double
            let longitude = dicCity["long"] as! Double
            let city = City(city: cityname, continent: continent, country: country, image: image, local: local, lat: latitude, lon: longitude, url: url)
            citys.append(city)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        title = "城市"
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 180, height: 120)
    }


}

extension ViewController{
    //UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return citys.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
        if cell.backgroundView == nil{
            let bv = UIView(frame: cell.bounds)
            bv.contentMode = .scaleToFill
            bv.backgroundColor = UIColor.lightGray
            cell.backgroundView = bv
            
            let sv = UIView(frame: cell.bounds)
            sv.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
            cell.selectedBackgroundView = sv;
        }
        return cell;
    }
    
}

