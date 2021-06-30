//
//  ViewController.swift
//  lesson10_2
//
//  Created by 徐國堂 on 2021/6/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myImageView:UIImageView!
    //var names:[String]?
    var names = ["robert", "jenny", "alice"]
    var countryCode = ["tw":"Taiwan", "jp":"Japan", "us":"US", "hk":"HongKong"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userClick(_ sender:UIButton){
        switch sender.tag{
        case 100:
            myImageView.image = UIImage(named: "pic1")
            print(names[0])
            if let country = countryCode["tw"]{
                print(country)
            }
        case 200:
            myImageView.image = UIImage(named: "pic2")
            print(names[1])
            if let country = countryCode["jp"]{
                print(country)
            }
        case 300:
            myImageView.image = UIImage(named: "pic3")
            print(names[2])
            if let country = countryCode["hk"]{
                print(country)
            }
        default:
            print("other")
        }
    }


}

