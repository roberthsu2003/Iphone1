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
