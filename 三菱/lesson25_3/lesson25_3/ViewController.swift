//
//  ViewController.swift
//  lesson25_3
//
//  Created by 徐國堂 on 2023/11/30.
//

import UIKit

class ViewController: UIViewController {
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemRed
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        return scrollView
    }()
    
    var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.scrollView)
    }


}

