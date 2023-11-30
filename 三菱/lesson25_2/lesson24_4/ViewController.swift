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
        print(scrollView.bounds.size)
        if !self.didLayou{
            self.didLayou = true
            let sz = scrollView.bounds.size
            let colors:[UIColor] = [.red, .green, .yellow]
            for i in 0..<colors.count{
                let innerView = UIView(frame: CGRect.init(
                    x: sz.width * CGFloat(i),
                    y: 0,
                    width: sz.width,
                    height: sz.height))
                innerView.backgroundColor = colors[i]
                innerView.layer.borderWidth = 1
                innerView.layer.borderColor = UIColor.black.cgColor
                self.scrollView.addSubview(innerView)
            }
            self.scrollView.contentSize = CGSize(width: 3 * sz.width, height: sz.height)
            self.scrollView.isPagingEnabled = true
        }
        
    }


}

