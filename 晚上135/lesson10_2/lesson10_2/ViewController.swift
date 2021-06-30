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
        print("button click")
    }


}

