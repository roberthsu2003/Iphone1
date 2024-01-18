//
//  MyCell.swift
//  2lesson7_3
//
//  Created by 徐國堂 on 2024/1/4.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var myImageView:UIImageView!
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var subLabel:UILabel!
    
    override func updateConfiguration(using state: UICellConfigurationState){
        var backgroundConfig = UIBackgroundConfiguration.listPlainCell().updated(for: state)


        // Customize the background color to use the tint color when the cell is highlighted or selected.
         if state.isHighlighted || state.isSelected {
             backgroundConfig.backgroundColor = .blue.withAlphaComponent(0.1)
         }else{
             backgroundConfig.backgroundColor = UIColor.systemBackground
         }

        backgroundConfig.backgroundInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            // Apply the background configuration to the cell.
            self.backgroundConfiguration = backgroundConfig
    }
    

}
