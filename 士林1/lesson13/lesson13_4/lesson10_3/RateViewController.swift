//
//  RateViewController.swift
//  lesson13_4
//
//  Created by 徐國堂 on 2025/4/23.
//

import UIKit

class RateViewController: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!
    var city = City()

    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.image = UIImage(named: city.image)
        backgroundImageView.addSubview(blurEffectView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
