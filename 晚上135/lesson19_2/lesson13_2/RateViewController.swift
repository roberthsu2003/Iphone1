//
//  RateViewController.swift
//  lesson19_2
//
//  Created by 徐國堂 on 2021/7/21.
//

import UIKit

class RateViewController: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!
    var city:City!

    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        backgroundImageView.addSubview(blurEffectView)
        blurEffectView.frame = view.bounds
        backgroundImageView.image = UIImage(named: city.image!)
    }
    

    @IBAction func cancer(_ sender:UIButton){
        dismiss(animated: true)
    }

}
