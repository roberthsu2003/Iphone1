//
//  ViewController.swift
//  lesson20-1
//
//  Created by 徐國堂 on 2021/2/23.
//

import UIKit

class ViewController: UICollectionViewController {
    var citys = [City]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        let pathURL = bundle.url(forResource: "citylist", withExtension: "plist")
        
        if let dicCitys = NSArray(contentsOf: pathURL!) as? [[String:Any]]{
            print(dicCitys)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

