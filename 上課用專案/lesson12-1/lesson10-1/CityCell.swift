//
//  CityCell.swift
//  lesson10-1
//
//  Created by 徐國堂 on 2021/1/12.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet var cityImageView:UIImageView!
    @IBOutlet var countryLabel:UILabel!
    @IBOutlet var continentLabel:UILabel!
    @IBOutlet var cityLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
