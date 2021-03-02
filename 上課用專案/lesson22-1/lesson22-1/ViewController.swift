//
//  ViewController.swift
//  lesson22-1
//
//  Created by 徐國堂 on 2021/3/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //bundle路後
        let sourcePath = Bundle.main.path(forResource: "citys", ofType: "db")
        print(sourcePath!)
        let targetPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var targetPath = targetPaths.first ?? ""
        targetPath += "/citys.db"
        DataSource.main;
        DataSource.main;
        DataSource.main;
        
    }


}

