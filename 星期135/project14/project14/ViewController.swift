//
//  ViewController.swift
//  project14
//
//  Created by 徐國堂 on 2022/7/18.
//

import UIKit

class ViewController: UICollectionViewController {
    var cities = [City]()
    
    override func awakeFromNib() {
        let bundle = Bundle.main;
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            return
        }
        let nsArray = try? NSArray(contentsOf: pathURL, error: ())
        if let array = nsArray as? [[String:Any]]{
            for cityDic in array{
                print(cityDic)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController")
    }


}

