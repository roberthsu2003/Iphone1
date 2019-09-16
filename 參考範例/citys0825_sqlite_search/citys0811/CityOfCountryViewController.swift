//
//  CityOfCountryViewController.swift
//  citys0811
//
//  Created by Robert on 2019/8/18.
//  Copyright © 2019 ios1. All rights reserved.
//

import UIKit

class CityOfCountryViewController: UICollectionViewController {
    var countryName:String!;
    lazy var citys:[City] = DataSource.main.getCitiesOfCountry(countryName: countryName) ?? [City]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = countryName;
    }

  
}

extension CityOfCountryViewController{
    // UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return citys.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let city = citys[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! CityViewCell;
        cell.cityImage.image = UIImage(named: city.image);
        cell.cityName.text = city.name;
        return cell;
    }
}
