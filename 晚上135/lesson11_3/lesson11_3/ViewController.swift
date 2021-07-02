//
//  ViewController.swift
//  lesson11_3
//
//  Created by 徐國堂 on 2021/7/2.
//

import UIKit

class ViewController: UIViewController {
    var names:[String]!
    var countryCode:[String:String]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let namesURL = Bundle.main.url(forResource: "names", withExtension: "plist"){
            if let names = NSArray(contentsOf: namesURL) as? [String]{
                self.names = names
            }
        }
        
        if let codeURL = Bundle.main.url(forResource: "countryCode", withExtension: "plist"){
            if let countryCode = NSDictionary(contentsOf: codeURL) as? [String:String]{
                self.countryCode = countryCode
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(names!)
        print(countryCode!)
       
    }


}

