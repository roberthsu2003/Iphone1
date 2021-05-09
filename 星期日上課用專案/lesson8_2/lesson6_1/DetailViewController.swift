//
//  DetailViewController.swift
//  lesson8_2
//
//  Created by 徐國堂 on 2021/5/9.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView:UIImageView!
    var city:[String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageName = city["Image"] as! String
        imageView.image = UIImage(named: imageName)
        let cityName = city["City"] as! String
        title = cityName
    }
    

    @IBAction func backToRoot(_ sender:UIBarButtonItem){
        navigationController?.popToRootViewController(animated: true)
    }
}
