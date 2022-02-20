//
//  RatingViewController.swift
//  project12
//
//  Created by 徐國堂 on 2022/2/20.
//

import UIKit

class RatingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func userClick(_ sender:UIButton){
        dismiss(animated: true, completion: nil)
    }
}
