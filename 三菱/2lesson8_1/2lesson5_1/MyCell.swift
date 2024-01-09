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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
