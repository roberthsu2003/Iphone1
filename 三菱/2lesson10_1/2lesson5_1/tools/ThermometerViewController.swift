//
//  ThermometerViewController.swift
//  2lesson9_2
//
//  Created by 徐國堂 on 2024/1/11.
//

import UIKit

class ThermometerViewController: UIViewController {
    lazy var seg:UISegmentedControl = {
        let action1 = UIAction(title: "prg1") { [self] _ in
            self.progressView1.progress = 0.0
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(incre1), userInfo: nil, repeats: true)
        }
        
        let action2 = UIAction(title: "prg2") { [self] _ in
            self.progressView2.progress = 0.0
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(incre2), userInfo: nil, repeats: true)
        }
        
        let action3 = UIAction(title: "prg3") { [self] _ in
            self.progressView3.progress = 0.0
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(incre3), userInfo: nil, repeats: true)
        }
        
        let action4 = UIAction(title: "prg4") { [self] _ in
            self.progressView4.value = 0.0
            progressView4.setNeedsDisplay()
            Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(incre4), userInfo: nil, repeats: true)
        }
        
        let seg = UISegmentedControl(items: [action1,action2,action3,action4])
        return seg
    }()
    
    @IBOutlet var progressView1:UIProgressView!
    @IBOutlet var progressView2:UIProgressView!
    @IBOutlet var progressView3:CircularProgressButton!
    @IBOutlet var progressView4:MyProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = seg
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //初始化progress1的外觀
        progressView1.progressTintColor = .red
        progressView1.trackTintColor = .black
        
        //初始化progress2的外觀
        let imageRender = UIGraphicsImageRenderer(size: CGSize.init(width: 10, height: 10))
        var trackIm:UIImage!
        let progressIm = imageRender.image { (context:UIGraphicsImageRendererContext) in
            let cgContext = context.cgContext
            //取得cgContext,透過cgContext畫圖片
            cgContext.setFillColor(UIColor.brown.cgColor)
            cgContext.fill(CGRect.init(x: 0, y: 0, width: 10.0, height: 10.0))
            trackIm = context.currentImage
            cgContext.setFillColor(UIColor.yellow.cgColor)
            cgContext.fillEllipse(in: CGRect.init(x: 2, y: 2, width: 6, height: 6))
        }
        
        progressView2.progressImage = progressIm.resizableImage(withCapInsets: UIEdgeInsets.init(top: 2, left: 4, bottom: 2, right: 4))
        progressView2.trackImage = trackIm
        
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
    
    @objc func incre3(_ timer:Timer){
        seg.isEnabled = false
        var value = progressView3.progress
        value += 0.1
        progressView3.progress = value
        if value >= 1.0{
            timer.invalidate()
            seg.isEnabled = true
            seg.selectedSegmentIndex = -1
        }
    }
    
    @objc func incre4(_ timer:Timer){
        seg.isEnabled = false
        var value = progressView4.value
        value += 0.1
        progressView4.value = value
        progressView4.setNeedsDisplay()
        if value >= 1.0{
            timer.invalidate()
            seg.isEnabled = true
            seg.selectedSegmentIndex = -1
        }
    }
    

   

}
