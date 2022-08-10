//
//  SiteViewCell.swift
//  lesson19
//
//  Created by 徐國堂 on 2022/8/10.
//

import UIKit

class SiteViewCell: UITableViewCell {
    @IBOutlet var siteName:UILabel!
    @IBOutlet var total:UILabel!
    @IBOutlet var rents:UILabel!
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
