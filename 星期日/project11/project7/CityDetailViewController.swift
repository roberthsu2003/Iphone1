//
//  CityDetailViewController.swift
//  project10
//
//  Created by 徐國堂 on 2022/2/13.
//

import UIKit

class CityDetailViewController: UIViewController {
    var city:City!
    @IBOutlet var cityImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("imageName=\(imageName!)")
        /*
        if let imageName = imageName {
            cityImageView.image = UIImage(named: imageName)
        }
        */
        cityImageView.image = UIImage(named: city.image)
        
    }
    

    

}
