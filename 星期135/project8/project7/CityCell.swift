//
//  CityCell.swift
//  project8
//
//  Created by 徐國堂 on 2022/7/6.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet var cityLable:UILabel!
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
