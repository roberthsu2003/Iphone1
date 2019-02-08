//
//  DetailViewCell.swift
//  Detail
//
//  Created by Robert on 2019/2/8.
//  Copyright © 2019 gjun. All rights reserved.
//

import UIKit

class DetailViewCell: UITableViewCell {
    @IBOutlet var fieldLabel:UILabel!;
    @IBOutlet var valueLabel:UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
