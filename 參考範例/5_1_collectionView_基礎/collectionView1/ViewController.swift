//
//  ViewController.swift
//  collectionView1
//
//  Created by 徐國堂 on 2023/11/17.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = self.collectionView.collectionViewLayout
        as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: 150, height: 50)
        let v = UIView()
        v.backgroundColor = .systemGray
        self.collectionView.backgroundView = v
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 1
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int{
        return 30
    }
    
    let cellID = "Cell"
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        if cell.backgroundView == nil{ //全新的cell
            cell.backgroundColor = .red
            let v = UIImageView(frame: cell.bounds)
            v.contentMode = .scaleToFill
            v.image = UIImage(named: "linen.png")
            cell.backgroundView = v
            
            let v2 = UIView(frame: cell.bounds)
            v2.backgroundColor = UIColor(white: 0.2, alpha: 0.2)
            cell.selectedBackgroundView = v2
            
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.tag = 1
            cell.contentView.addSubview(lab)
            NSLayoutConstraint.activate([
                lab.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
                lab.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            ])
            lab.textColor = .black
            lab.highlightedTextColor = .white
            lab.backgroundColor = .clear
        }
        
        let lab = cell.viewWithTag(1) as! UILabel
        lab.text = "Howdy there \(indexPath.item)"
        return cell
    }

}

extension ViewController{
    //UICollectionViewDataSource
}

