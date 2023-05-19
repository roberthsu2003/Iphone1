//
//  RatingViewController.swift
//  lesson13_1
//
//  Created by 徐國堂 on 2023/5/12.
//

import UIKit

class RatingViewController: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var containerImageView:UIImageView!
    var city:City!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: city.image)
        containerImageView.image = UIImage(named: city.image)
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    }
    
    
    
}
