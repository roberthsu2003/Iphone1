//
//  ViewController.swift
//  project3
//
//  Created by 徐國堂 on 2022/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel = UILabel(
            frame:CGRect(x: 100, y: 100, width: 100, height: 40)
        )
        myLabel.text = "Hello! iOS!"
        
        view.addSubview(myLabel)
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

