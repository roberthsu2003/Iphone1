//
//  CityCell.swift
//  simpleTableView
//
//  Created by Robert on 2019/2/4.
//  Copyright © 2019 gjun. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet var cityLabel:UILabel!;
    @IBOutlet var countryLabel:UILabel!;
    @IBOutlet var continentLabel:UILabel!;
    @IBOutlet var cityImageView:UIImageView!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
