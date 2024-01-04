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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
