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
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 180, height: 120)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goMap" {
            print("執行segue")
        }
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
        let city = citys[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
        if cell.backgroundView == nil{
            cell.backgroundColor = UIColor.lightGray
            let bv = UIView(frame: cell.bounds)
            bv.contentMode = .scaleToFill
            bv.backgroundColor =  UIColor.lightGray
            cell.backgroundView = bv;
            
            let selectionView = UIView(frame: cell.bounds)
            selectionView.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
            selectionView.contentMode = .scaleToFill
            cell.selectedBackgroundView = selectionView
            
            let cityImageView = UIImageView(frame: cell.bounds)
            cityImageView.tag = 1
            cityImageView.contentMode = .scaleAspectFill
            
            cityImageView.translatesAutoresizingMaskIntoConstraints = false
            cell.contentView.addSubview(cityImageView)
            NSLayoutConstraint.activate([
                cityImageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                cityImageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10),
                cityImageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 0),
                cityImageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 0)
            ])
        }
        
        //cityImageView.image = UIImage(named: city.image)
        let cityImageView = cell.viewWithTag(1) as! UIImageView
        cityImageView.image = UIImage(named: city.image)
        return cell
    }
    
    
}

extension ViewController{
    //UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath){
        print("rowIndex:\(indexPath.row)")
        performSegue(withIdentifier: "goMap", sender: nil)
    }
}

