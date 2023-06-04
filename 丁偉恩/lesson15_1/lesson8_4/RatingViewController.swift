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
    @IBOutlet var askLabel:UILabel!
    @IBOutlet var containerView:UIView!
    var city:City!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: city.image)
        containerImageView.image = UIImage(named: city.image)
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        askLabel.text = "您曾經來過這裏嗎?\n給這個城市一個描素吧?"
        containerView.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func userClick(_ sender:UIButton){
        if let titleLabel = sender.titleLabel{
            print(titleLabel.text!)
            self.dismiss(animated: true)
        }
        
    }
    
    
    
}
