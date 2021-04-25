//
//  CityCell.swift
//  lesson6_1
//
//  Created by 徐國堂 on 2021/4/25.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet var cityLabel:UILabel!
    @IBOutlet var countryLabel:UILabel!
    @IBOutlet var continentLabel:UILabel!
    @IBOutlet var cityImageView:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        cityImageView.layer.cornerRadius = 10
        let backgroundView = UIView();
        backgroundView.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        selectedBackgroundView = backgroundView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print("selected")
    }

}
