//
//  ViewController.swift
//  project13
//
//  Created by 徐國堂 on 2022/2/27.
//

import UIKit

class ViewController:UICollectionViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "城市"
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 180, height: 120)
    }


}

