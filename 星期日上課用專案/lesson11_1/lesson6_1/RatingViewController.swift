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
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = UIImage(named: city.image)
        let blurEffect = UIBlurEffect(style: .dark);
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
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
