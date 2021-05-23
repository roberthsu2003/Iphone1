//
//  RatingViewController.swift
//  lesson11_1
//
//  Created by 徐國堂 on 2021/5/23.
//

import UIKit

class RatingViewController: UIViewController {
    var city:City!
    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var containerView:UIView!
    @IBOutlet var cityImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: city.image)
        cityImageView.image = UIImage(named: city.image)
        let blurEffect = UIBlurEffect(style: .dark);
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        containerView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = CGAffineTransform.identity
        }
        
    }
    
    @IBAction func userClick(_ sender:UIButton){
        switch sender.tag{
        case 1:
            print("科技化城式")
        case 2:
            print("風景不錯")
        case 3:
            print("很現代化的城市")
        case 4:
            print("環保的城市")
        default:
            break
        }
    }
    
}
