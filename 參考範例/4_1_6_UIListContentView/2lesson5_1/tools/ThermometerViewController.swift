//
//  ThermometerViewController.swift
//  2lesson5_2
//
//  Created by 徐國堂 on 2024/1/7.
//

import UIKit

class ThermometerViewController: UIViewController {
    var seg:UISegmentedControl!
    @IBOutlet var progressView1:UIProgressView!
    @IBOutlet var progressView2:UIProgressView!
    @IBOutlet var progressView3:MyProgressView!
    @IBOutlet var progressView4:MyCircularProgressButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView1.progress = 0
        progressView2.progress = 0
        let action1 = UIAction(title: "progress") { [self] _ in
            progressView1.progress = 0
            progressView2.progress = 0
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(inc1), userInfo: nil, repeats: true)
        }
        
        let action2 = UIAction(title: "View") { [self] _ in
            progressView3.value = 0
            progressView3.setNeedsDisplay()
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(inc2), userInfo: nil, repeats: true)
        }
        
        let action3 = UIAction(title: "Button") { [self] _ in
            progressView4.progress = 0
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(inc3), userInfo: nil, repeats: true)
        }
        seg = UISegmentedControl(items: [action1,action2,action3])
        navigationItem.titleView = seg
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let imageRender = UIGraphicsImageRenderer(size: CGSize.init(width: 10, height: 10))
        var trackim:UIImage?
        let im = imageRender.image { (context:UIGraphicsImageRendererContext) in
            let con = context.cgContext
            //track
            con.setFillColor(UIColor.black.cgColor)
            con.fill(CGRect.init(x: 0, y: 0, width: 10, height: 10))
            trackim = context.currentImage
            
            //
            con.setFillColor(UIColor.yellow.cgColor)
            con.fillEllipse(in: CGRect.init(x: 2, y: 2, width: 6, height: 6))
        }
        self.progressView2.trackImage = trackim?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 4, left: 4, bottom: 4, right: 4), resizingMode: .stretch)
        self.progressView2.progressImage = im.resizableImage(withCapInsets: UIEdgeInsets.init(top: 4, left: 4, bottom: 5, right: 4), resizingMode: .stretch)
        
        
    }
    
    @objc func inc1(_ t:Timer){
        seg.isEnabled = false
        var val = progressView1.progress
        val += 0.1
        self.progressView1.progress = val
        self.progressView2.progress = val
        if val >= 1.0{
            t.invalidate()
            seg.isEnabled = true
        }
        
    }
    
    @objc func inc2(_ t:Timer){
        seg.isEnabled = false
        var val = progressView3.value
        val += 0.1
        self.progressView3.value = val
        self.progressView3.setNeedsDisplay()
        if val >= 1.0{
            t.invalidate()
            seg.isEnabled = true
        }
        
    }
    
    @objc func inc3(_ t:Timer){
        seg.isEnabled = false
        var val = progressView4.progress
        val += 0.1
        self.progressView4.progress = val
        if val >= 1.0{
            t.invalidate()
            seg.isEnabled = true
        }
        
    }
    

}
