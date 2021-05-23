//
//  DetailViewCell.swift
//  lesson9_1
//
//  Created by 徐國堂 on 2021/5/16.
//

import UIKit

class DetailViewCell: UITableViewCell {
    @IBOutlet var fieldLable:UILabel!
    @IBOutlet var valueLable:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
