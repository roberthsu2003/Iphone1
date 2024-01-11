//
//  ThermometerViewController.swift
//  2lesson9_2
//
//  Created by 徐國堂 on 2024/1/11.
//

import UIKit

class ThermometerViewController: UIViewController {
    lazy var seg:UISegmentedControl = {
        let action1 = UIAction(title: "progress1") { _ in
            self.progressView1.progress = 0.0
        }
        let seg = UISegmentedControl(items: [action1])
        return seg
    }()
    
    @IBOutlet var progressView1:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = seg
        
    }
    

   

}
