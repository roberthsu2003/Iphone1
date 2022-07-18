//
//  RatingViewController.swift
//  project13
//
//  Created by 徐國堂 on 2022/7/15.
//

import UIKit

class RatingViewController: UIViewController {
    var city:City!
    @IBOutlet var cityImageView:UIImageView!
    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var containerView:UIView!
    @IBOutlet var askLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        containerView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        cityImageView.image = UIImage(named: city.image)
        askLabel.text = "您曾經來過這裏嗎?\n給這個城市一個描素吧!"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = CGAffineTransform.identity
        }
    }
    
    

    
}
