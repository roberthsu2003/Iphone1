//
//  ViewController.swift
//  lesson11_3
//
//  Created by 徐國堂 on 2021/7/2.
//

import UIKit

class ViewController: UIViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
        if let namesURL = Bundle.main.url(forResource: "names", withExtension: "plist"){
            print(namesURL.path)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }


}

