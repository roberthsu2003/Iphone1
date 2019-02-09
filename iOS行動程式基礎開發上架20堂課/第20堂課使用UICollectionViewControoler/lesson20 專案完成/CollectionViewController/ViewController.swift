//
//  ViewController.swift
//  CollectionViewController
//
//  Created by Robert on 2019/2/9.
//  Copyright © 2019 Robert. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var citys = [City]();
    var cityIsMarded:[Bool]!;
    let cellID = "CELL"
    
    override func awakeFromNib() {
        super .awakeFromNib();
        let bundle = Bundle.main;
        let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")!;
        if let dicCitys = NSArray(contentsOf: pathURL) as? [[String:Any]]{
            for dicCity in dicCitys{
                let city = City();
                city.city = dicCity["City"] as? String;
                city.country = dicCity["Country"] as? String;
                city.continent = dicCity["Continent"] as? String;
                city.image = dicCity["Image"] as? String;
                city.local = dicCity["Local"] as? String;
                city.url = dicCity["url"] as? String;
                city.latitude = dicCity["lat"] as? Double;
                city.longitude = dicCity["long"] as? Double;
                citys.append(city);
            }
        }
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "城市"
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout;
        layout.itemSize = CGSize(width: 180, height: 120);
    }


}

extension ViewController{
    //UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return citys.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID,
                                                      for: indexPath)
        let city = citys[indexPath.row];
        if cell.backgroundView == nil { // brand new cell
            //cell.backgroundColor = UIColor.lightGray
            
            let bv = UIView(frame:cell.bounds)
            bv.contentMode = .scaleToFill
            bv.backgroundColor = UIColor.lightGray;
            cell.backgroundView = bv
            
            let selectionView = UIView(frame:cell.bounds)
            selectionView.backgroundColor = UIColor(white:0.2, alpha:0.5)
            cell.selectedBackgroundView = selectionView
            
            let cityImageView = UIImageView(frame: cell.bounds);
            cityImageView.tag = 1;
            cityImageView.contentMode = .scaleAspectFill;
            cityImageView.translatesAutoresizingMaskIntoConstraints = false;
            cell.contentView.addSubview(cityImageView);
            NSLayoutConstraint.activate([
                cityImageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 0),
                cityImageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 0),
                cityImageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 0),
                cityImageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: 0)
                ])
            
            
            let cityLabel = UILabel()
            cityLabel.translatesAutoresizingMaskIntoConstraints = false
            cityLabel.tag = 2
            cell.contentView.addSubview(cityLabel)
            NSLayoutConstraint.activate([
                cityLabel.centerXAnchor.constraint(equalTo:cell.contentView.centerXAnchor),
                cityLabel.centerYAnchor.constraint(equalTo:cell.contentView.centerYAnchor)
                ])
            cityLabel.textColor = .white
            cityLabel.highlightedTextColor = .black
            cityLabel.backgroundColor = .clear
            
            
        }
        let cityImageView = cell.viewWithTag(1) as! UIImageView
        cityImageView.image = UIImage(named: city.image)
        let lab = cell.viewWithTag(2) as! UILabel
        lab.text = city.city;
        return cell
    }
}

