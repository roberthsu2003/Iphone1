//
//  ThermometerViewController.swift
//  2lesson9_2
//
//  Created by 徐國堂 on 2024/1/11.
//

import UIKit

class ThermometerViewController: UIViewController {
    lazy var seg:UISegmentedControl = {
        let seg = UISegmentedControl(items: ["pro1","pro2","pro3","pro4"])
        return seg
    }()
    
    @IBOutlet var progressView1:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = seg
        
    }
    

   

}
