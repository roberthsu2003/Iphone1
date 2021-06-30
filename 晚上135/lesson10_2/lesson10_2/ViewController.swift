//
//  ViewController.swift
//  lesson10_2
//
//  Created by 徐國堂 on 2021/6/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myImageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userClick(_ sender:UIButton){
        switch sender.tag{
        case 100:
            myImageView.image = UIImage(named: "pic1")
        case 200:
            myImageView.image = UIImage(named: "pic2")
        case 300:
            myImageView.image = UIImage(named: "pic3")
        default:
            print("other")
        }
    }


}

