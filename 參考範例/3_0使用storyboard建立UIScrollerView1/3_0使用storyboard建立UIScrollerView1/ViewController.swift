//
//  ViewController.swift
//  3_0使用storyboard建立UIScrollerView1
//
//  Created by 徐國堂 on 2023/11/7.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scrollView:UIScrollView!
    @IBOutlet var contentView:UIView!
    
    var didSetup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !self.didSetup{
            self.didSetup = true
            self.scrollView.contentSize = self.contentView.bounds.size
        }
        print(self.scrollView.contentSize)
    }


}

