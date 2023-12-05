//
//  Section.swift
//  collectionView_section
//
//  Created by 徐國堂 on 2023/12/1.
//

import UIKit

class Section: UICollectionViewCell {
    @IBOutlet var textLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .darkGray
        self.textLabel.textColor = .white
    }

}
