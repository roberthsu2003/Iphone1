//
//  MyCell.swift
//  lesson13_2
//
//  Created by 徐國堂 on 2021/7/7.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var cityImageView:UIImageView!
    @IBOutlet var cityName:UILabel!
    @IBOutlet var countryName:UILabel!
    @IBOutlet var continent:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
