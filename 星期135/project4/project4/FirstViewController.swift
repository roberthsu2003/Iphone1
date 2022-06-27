//
//  FirstViewController.swift
//  project4
//
//  Created by 徐國堂 on 2022/6/27.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var heightTextField:UITextField!
    @IBOutlet var weightTextField:UITextField!
    @IBOutlet var okButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        okButton.addTarget(self, action: #selector(userClick(_:)), for:.touchUpInside)
       
    }
    
    @objc func userClick(_ sender:UIButton){
        print("user click")
    }
    

  

}
