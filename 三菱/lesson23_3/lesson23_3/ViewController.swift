//
//  ViewController.swift
//  lesson23_3
//
//  Created by 徐國堂 on 2023/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var containerView:UIView!
    @IBOutlet var scrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = containerView.bounds.size
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //print(containerView.frame)
        print(containerView.bounds)
        print(containerView.bounds.size)
    }


}

