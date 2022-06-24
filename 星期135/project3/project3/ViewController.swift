//
//  ViewController.swift
//  project3
//
//  Created by 徐國堂 on 2022/6/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("現在執行ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("view將要出現了")
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        print("view已經出現了")
    }


}

