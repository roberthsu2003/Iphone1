//
//  RatingViewController.swift
//  project12
//
//  Created by 徐國堂 on 2022/2/20.
//

import UIKit

class RatingViewController: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!;
    @IBOutlet var askLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        askLabel.text = "您曾經來過這裏嗎?\n給這個城市一個描素吧!"
    }
    

    
}
