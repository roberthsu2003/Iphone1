//
//  SiteViewCell.swift
//  lesson3_1
//
//  Created by 徐國堂 on 2021/3/30.
//

import UIKit

class SiteViewCell: UITableViewCell {
    @IBOutlet var siteName:UILabel!
    @IBOutlet var total:UILabel!
    @IBOutlet var rent:UILabel!
    @IBOutlet var returns:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
