//
//  RatingViewControll.swift
//  Animation
//
//  Created by Robert on 2019/2/8.
//  Copyright © 2019 gjun. All rights reserved.
//

import UIKit

class RatingViewControll: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!;
    @IBOutlet var askLabel:UILabel!;
    @IBOutlet var containerView:UIView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark);
        let blurEffectView = UIVisualEffectView(effect: blurEffect);
        blurEffectView.frame = view.bounds;
        backgroundImageView.addSubview(blurEffectView);
        askLabel.text = "您曾經來過這裏嗎?\n給這個城市一個描素吧!";
        
        containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform.identity;
        })
    }

    

}
