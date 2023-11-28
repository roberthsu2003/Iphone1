//
//  ViewController.swift
//  lesson24_4
//
//  Created by 徐國堂 on 2023/11/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scrollView:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(scrollView.bounds.size)
    }
    
    var didLayou = false
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !self.didLayou{
            self.didLayou = true
            print(scrollView.bounds.size)
            
        }
        
    }


}

