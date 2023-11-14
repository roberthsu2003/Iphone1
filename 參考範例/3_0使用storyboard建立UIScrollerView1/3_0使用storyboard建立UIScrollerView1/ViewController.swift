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
        //也可以寫在這裏
        //self.scrollView.contentSize = self.contentView.bounds.size
        //print(self.scrollView.contentSize)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !self.didSetup{
            self.didSetup = true
            self.scrollView.contentSize = self.contentView.bounds.size
            //可以試加入這行,會增加contentInsets
            //self.scrollView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        }
        print(self.scrollView.contentSize)
         
    }


}

