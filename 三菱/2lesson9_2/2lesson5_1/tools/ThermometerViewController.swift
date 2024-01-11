//
//  ThermometerViewController.swift
//  2lesson9_2
//
//  Created by 徐國堂 on 2024/1/11.
//

import UIKit

class ThermometerViewController: UIViewController {
    lazy var seg:UISegmentedControl = {
        let action1 = UIAction(title: "progress1") { [self] _ in
            self.progressView1.progress = 0.0
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(incre1), userInfo: nil, repeats: true)
        }
        
        let action2 = UIAction(title: "progress2") { [self] _ in
            self.progressView2.progress = 0.0
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(incre2), userInfo: nil, repeats: true)
        }
        
        let seg = UISegmentedControl(items: [action1,action2])
        return seg
    }()
    
    @IBOutlet var progressView1:UIProgressView!
    @IBOutlet var progressView2:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = seg
        
    }
    @objc func incre1(_ timer:Timer){
        seg.isEnabled = false
        var value = progressView1.progress
        value += 0.1
        progressView1.progress = value
        if value >= 1.0{
            timer.invalidate()
            seg.isEnabled = true
            seg.selectedSegmentIndex = -1
        }
    }
    
    @objc func incre2(_ timer:Timer){
        seg.isEnabled = false
        var value = progressView2.progress
        value += 0.1
        progressView2.progress = value
        if value >= 1.0{
            timer.invalidate()
            seg.isEnabled = true
            seg.selectedSegmentIndex = -1
        }
    }
    

   

}
