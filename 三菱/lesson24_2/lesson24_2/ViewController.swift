//
//  ViewController.swift
//  lesson24_2
//
//  Created by 徐國堂 on 2023/11/28.
//

import UIKit

class ViewController: UIViewController {
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.indicatorStyle = .default
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        let safeLayoutGuid = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeLayoutGuid.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeLayoutGuid.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeLayoutGuid.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeLayoutGuid.bottomAnchor)
        ])
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scroll = self.scrollView
       
    }


}

