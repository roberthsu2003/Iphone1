//
//  ViewController.swift
//  zooming
//
//  Created by 徐國堂 on 2023/11/28.
//

import UIKit

class ViewController: UIViewController {
    var scrollView:UIScrollView!
    var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView()
        imageView.image = UIImage(named: "bird.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.minimumZoomScale = 1
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
        
        self.imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        
        self.scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor).isActive = true
        
        
    }


}

extension ViewController:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
        print("abc")
        return imageView
    }
}

