//
//  ViewController.swift
//  2lesson4_1
//
//  Created by 徐國堂 on 2023/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doButton1(_ sender:UIButton){
        let docs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(docs.last ?? "沒有路徑")
    }

}

