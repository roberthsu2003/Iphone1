//
//  ViewController.swift
//  lesson22_4
//
//  Created by 徐國堂 on 2023/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scrollView:UIScrollView!
    @IBOutlet var containerView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = containerView.bounds.size
    }


}

