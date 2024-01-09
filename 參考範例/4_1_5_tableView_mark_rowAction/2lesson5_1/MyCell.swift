//
//  MyCell.swift
//  2lesson5_2
//
//  Created by 徐國堂 on 2024/1/2.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var subLabel:UILabel!
    @IBOutlet var cityImage:UIImageView!
    @IBOutlet var leadingConstraint:NSLayoutConstraint!    
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var backgroundConfig = UIBackgroundConfiguration.listPlainCell().updated(for: state)
        if state.isHighlighted || state.isSelected {
                //backgroundColor如果設定為nil則繼承父容器的tintColor
                //使用父類別的tintColor
                //backgroundConfig.backgroundColor = nil
            backgroundConfig.backgroundColor = .red.withAlphaComponent(0.1)
        }else{
            backgroundConfig.backgroundColor = .blue.withAlphaComponent(0.1)
        }
        backgroundConfig.backgroundInsets =  NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        self.backgroundConfiguration = backgroundConfig
    }

}
