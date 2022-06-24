//
//  ViewController.swift
//  project3
//
//  Created by 徐國堂 on 2022/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("view將要出現了")
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        myLabel.text = "view已經出現了"
    }


}

