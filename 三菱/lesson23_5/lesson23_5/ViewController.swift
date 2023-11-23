//
//  ViewController.swift
//  lesson23_5
//
//  Created by 徐國堂 on 2023/11/23.
//

import UIKit

class ViewController: UIViewController {
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.indicatorStyle = .default
        scrollView.backgroundColor = .systemGray
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        let contentLayouGuide = scrollView.contentLayoutGuide
        /*
        NSLayoutConstraint.activate([
            contentLayouGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentLayouGuide.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            contentLayouGuide.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            contentLayouGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 1000)
        ])
         */
        contentLayouGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 1000).isActive = true
        //contentLayouGuide.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 1000).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("scrollView的frame")
        print(scrollView.frame)
        
        print("frameLayoutGuide")
        print(scrollView.frameLayoutGuide)
        
        print("contentLayoutGuide")
        print(scrollView.contentLayoutGuide)
    }


}

