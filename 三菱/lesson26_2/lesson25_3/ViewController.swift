//
//  ViewController.swift
//  lesson25_3
//
//  Created by 徐國堂 on 2023/11/30.
//

import UIKit
class MyScrollView:UIScrollView{
    override func layoutSubviews(){
        super.layoutSubviews()
        /*
        if let imageView = self.viewWithTag(111) as? UIImageView{
            print("有imageView")
        }*/
        
        if let view = self.delegate?.viewForZooming?(in: self){
            var viewFrame = view.frame
            print(viewFrame.origin.x)
            print(viewFrame.origin.y)
        }
        
        
        
    }
}

class ViewController: UIViewController {
    private lazy var scrollView:MyScrollView = {
        let scrollView = MyScrollView()
        scrollView.delegate = self
        //scrollView.backgroundColor = .systemRed
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 5
        return scrollView
    }()
    
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.tag = 111
        imageView.image = UIImage(named: "bird.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false      
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
    }


}

extension ViewController:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
        if let imageView = scrollView.viewWithTag(111) as? UIImageView{
            return imageView
        }else{
            return nil
        }
    }
    
    func scrollViewWillBeginZooming(
        _ scrollView: UIScrollView,
        with view: UIView?
    ){
        print("開始縮放")
    }
    
    func scrollViewDidEndZooming(
        _ scrollView: UIScrollView,
        with view: UIView?,
        atScale scale: CGFloat
    ){
        print("結束縮放")
    }
    
    
}

