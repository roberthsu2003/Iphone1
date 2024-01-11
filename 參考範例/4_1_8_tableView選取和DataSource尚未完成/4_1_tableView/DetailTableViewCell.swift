//
//  DetailTableViewCell.swift
//  4_1_tableView
//
//  Created by 徐國堂 on 2024/1/11.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet var fieldName:UILabel!
    @IBOutlet var fieldContent:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
