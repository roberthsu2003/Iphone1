//
//  ViewController.swift
//  lesson5_1
//
//  Created by 徐國堂 on 2021/4/18.
//

import UIKit

class ViewController: UIViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        let url = bundle.url(forResource: "citylist", withExtension: "plist")!
        print(url.path)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }


}

