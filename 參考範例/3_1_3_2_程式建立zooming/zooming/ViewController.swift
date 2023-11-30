//
//  ViewController.swift
//  zooming
//
//  Created by 徐國堂 on 2023/11/28.
//

import UIKit

class MyScrollView:UIScrollView{
    override func layoutSubviews() {
        /*為了要讓圖片置中*/
        super.layoutSubviews()
        if let view = self.delegate?.viewForZooming?(in: self){
            let scrollViewWidth = self.bounds.width
            let scrollViewHeight = self.bounds.height
            let viewWidth = view.frame.width //要用frame,因為bounds的大小不會改變
            let viewHeight = view.frame.height
            var viewFrame = view.frame
            if viewWidth < scrollViewWidth{
                viewFrame.origin.x = (scrollViewWidth - viewWidth) / 2.0
            }else{
                viewFrame.origin.x = 0 //不知為何要0
            }
            
            if viewHeight < scrollViewHeight{
                viewFrame.origin.y = (scrollViewHeight - viewHeight) / 2.0
            }else{
                viewFrame.origin.y = 0 //不知為何要0
            }
            
            view.frame = viewFrame
        }
    }
}

class ViewController: UIViewController {
    var scrollView:MyScrollView!
    var imageView:UIImageView!
    var tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.addTarget(self, action: #selector(tapped(_:)))
        imageView = UIImageView()
        imageView.isUserInteractionEnabled = true //一定要開啟
        imageView.image = UIImage(named: "bird.jpg")
        imageView.addGestureRecognizer(tapGesture)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView = MyScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        self.scrollView.addSubview(imageView)
        
        self.imageView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        
        //self.scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor).isActive = true
        
    }
    
    @objc func tapped(_ tap:UITapGestureRecognizer){
        //點2下,回覆狀態
        let imageView = tap.view!
        let scrollView = imageView.superview as! UIScrollView
        scrollView.setZoomScale(1, animated: true)
    }


}

extension ViewController:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
        return imageView
    }
    
    func scrollViewWillBeginZooming(
        _ scrollView: UIScrollView,
        with view: UIView?
    ){
        print("開始縮放")
        scrollView.bounces = false
    }
    
    func scrollViewDidEndZooming(
        _ scrollView: UIScrollView,
        with view: UIView?,
        atScale scale: CGFloat
    ){
        print("結束縮放")
        scrollView.bounces = true
       
    }
}

