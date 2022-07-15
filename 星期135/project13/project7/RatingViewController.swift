//
//  RatingViewController.swift
//  project13
//
//  Created by 徐國堂 on 2022/7/15.
//

import UIKit

class RatingViewController: UIViewController {
    var city:City!
    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var containerView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        containerView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func backToDetailViewController(_ sender:UIButton){
        dismiss(animated: true) {
            print("回到DetailViewController")
        }
    }
    

    
}
