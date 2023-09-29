//
//  ViewController.swift
//  程式建立scrollerView
//
//  Created by 徐國堂 on 2023/9/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemCyan
        let sv = UIScrollView(frame: self.view.bounds)
        sv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(sv)
        sv.backgroundColor = UIColor.systemGray
        
        var y: CGFloat = 50
        for i in 0 ..< 30{
            let lab = UILabel()
            lab.text = "這是Label \(i+1)"
            lab.sizeToFit()
            lab.frame.origin = CGPoint(x: 10, y: y)
            sv.addSubview(lab)
            y += lab.bounds.size.height + 10
        }
        var sz = sv.bounds.size
        sz.height = y
        sv.contentSize = sz
    }


}

