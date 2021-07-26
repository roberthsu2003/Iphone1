//
//  CityCollectionViewController.swift
//  lesson12_1
//
//  Created by 徐國堂 on 2021/6/6.
//

import UIKit
import FMDB



class CityCollectionViewController: UICollectionViewController {
    var cities = [String]()
    
    func getAllCity() -> [String]?{
        let citysPath = Bundle.main.url(forResource: "citys", withExtension: "db")
        let db = FMDatabase(url: citysPath)
        db.open()
        guard let rs = try? db.executeQuery("SELECT cityName FROM city", values: nil) else{
            print("執行錯誤")
            return nil;
        }
        var citys = [String]()
        while rs.next(){
            if let countryName = rs["cityName"] as? String{
                citys.append(countryName)
            }
          
        }
        db.close()
        
        return citys
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = getAllCity()!
        
       
    }

   
}

extension CityCollectionViewController{
    //MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return cities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! MyCell
        let cityName = cities[indexPath.row]
        cell.nameLabel.text = cityName
        return cell
    }
}
