//
//  ViewController.swift
//  lesson16
//
//  Created by 徐國堂 on 2022/7/27.
//

import UIKit

class ViewController: UIViewController {
    
    override func awakeFromNib() {
        guard let sourceUrl = Bundle.main.url(forResource: "citylist", withExtension: "plist") else{
            return
        }
        print(sourceUrl.path)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

