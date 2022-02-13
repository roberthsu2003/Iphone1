//
//  CityDetailViewController.swift
//  project10
//
//  Created by 徐國堂 on 2022/2/13.
//

import UIKit

class CityDetailViewController: UIViewController {
    var imageName:String!
    @IBOutlet var cityImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("imageName=\(imageName!)")
        cityImageView.image = UIImage(named: imageName)
        
    }
    
    deinit{
        print("CityDetailViewController被消滅")
    }
    

}
