//
//  ViewController.swift
//  lesson11_3
//
//  Created by 徐國堂 on 2021/7/2.
//

import UIKit

class ViewController: UIViewController {
    var names:[String]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let namesURL = Bundle.main.url(forResource: "names", withExtension: "plist"){
            if let names = NSArray(contentsOf: namesURL) as? [String]{
                self.names = names
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(names!)
       
    }


}

