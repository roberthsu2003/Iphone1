//
//  ViewController.swift
//  collectionView_section
//
//  Created by 徐國堂 on 2023/12/1.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.sectionHeadersPinToVisibleBounds = true
        }
        
        let cellNib = UINib(nibName: "Cell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "Cell")
        
        let sectionNib = UINib(nibName: "Section", bundle: nil)
        self.collectionView.register(sectionNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Section")
    }
}

extension ViewController:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return DataSource.continents.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int{
        let continent = DataSource.continents[section]
        let dataSource = DataSource()
        if let cities = dataSource[continent]{
            return cities.count
        }else{
            return 0
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell{
        let section = indexPath.section
        let item = indexPath.item
        let continent = DataSource.continents[section]
        let dataSource = DataSource()
        let cities = dataSource[continent] ?? [String]()
        let city = cities[item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.textLabel.text = city
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView{
        let section = indexPath.section
        let continent = DataSource.continents[section]
        guard kind == UICollectionView.elementKindSectionHeader else{
            return UICollectionReusableView()
        }
        let sectionView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Section", for: indexPath) as! Section
        sectionView.textLabel.text = continent
        print(continent)
        return sectionView
    }
    
    
}

extension ViewController:UICollectionViewDelegate{
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 16, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width: collectionView.bounds.size.width, height: 64)
    }
}

