//
//  ViewController.swift
//  test
//
//  Created by 徐國堂 on 2023/9/30.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet var sv:UIScrollView!
    @IBOutlet var pager:UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sv.delegate = self
        self.pager.currentPageIndicatorTintColor = .systemRed
        self.pager.pageIndicatorTintColor = .systemGray
        // self.pager.backgroundColor = .blue
//         self.pager.backgroundStyle = .prominent
//        self.pager.pageIndicatorTintColor = .yellow
//        self.pager.currentPageIndicatorTintColor = .orange
//        self.pager.tintColor = .green // does nothing
//        self.pager.allowsContinuousInteraction = false
//        self.pager.preferredIndicatorImage = UIImage(systemName: "diamond.fill")!
//        self.pager.setIndicatorImage(UIImage(named: "trash")!.withRenderingMode(.alwaysOriginal), forPage: 0)
//        self.pager.numberOfPages = 20
//        print(self.pager.size(forNumberOfPages: 20))
//        print(self.pager.size(forNumberOfPages: 30))
    }
    
    var didLayout = false
    override func viewDidLayoutSubviews() {
        if !self.didLayout{
            self.didLayout = true
            let sz = self.sv.bounds.size
            let colors:[UIColor] = [.red, .green, .yellow]
            for i in 0 ..< 3{
                let v = UIView(frame: CGRect(x: sz.width*CGFloat(i), y: 0, width: sz.width, height: sz.height))
                v.backgroundColor = colors[i]
                self.sv.addSubview(v)
            }
            self.sv.contentSize = CGSize(width: 3*sz.width, height: sz.height)
            self.sv.layer.borderWidth = 1
        }
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("begin")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("end")
        let x = self.sv.contentOffset.x
        let w = self.sv.bounds.size.width
        self.pager.currentPage = Int(x/w)
    }
    
    @IBAction func userDidPage(_ sender:Any?){
        let p = self.pager.currentPage
        let w = self.sv.bounds.size.width
        self.sv.setContentOffset(CGPoint(x: CGFloat(p)*w, y: 0), animated: true)
    }


}

