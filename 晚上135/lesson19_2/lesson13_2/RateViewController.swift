//
//  RateViewController.swift
//  lesson19_2
//
//  Created by 徐國堂 on 2021/7/21.
//

import UIKit

class RateViewController: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var topImageView:UIImageView!
    @IBOutlet var containerView:UIView!
    
    var city:City!
    var callBackMethod:((String) -> Void)!

    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        backgroundImageView.addSubview(blurEffectView)
        blurEffectView.frame = view.bounds
        backgroundImageView.image = UIImage(named: city.image!)
        topImageView.image = UIImage(named: city.image!)
    }
    

    @IBAction func cancer(_ sender:UIButton){
        dismiss(animated: true)
        callBackMethod("這是RateViewController的字串")
    }

}
