//
//  ViewController.swift
//  lesson17
//
//  Created by 徐國堂 on 2022/7/27.
//

import UIKit

class ViewController: UIViewController {
    
    override func awakeFromNib() {
        DataSource.copyFileToDocuments()        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

