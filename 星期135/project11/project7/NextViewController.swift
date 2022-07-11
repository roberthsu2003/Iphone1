//
//  NextViewController.swift
//  project11
//
//  Created by 徐國堂 on 2022/7/8.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func userback(_ sender:UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }

}
