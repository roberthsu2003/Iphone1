//
//  CityCell.swift
//  lesson10_3
//
//  Created by 徐國堂 on 2025/4/2.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet var cityLabel:UILabel!
    @IBOutlet var countryLabel:UILabel!
    @IBOutlet var continentLabel:UILabel!
    @IBOutlet var cityImageView:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
