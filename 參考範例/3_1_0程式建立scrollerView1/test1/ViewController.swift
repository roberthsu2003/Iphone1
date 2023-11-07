//
//  ViewController.swift
//  test1
//
//  Created by 徐國堂 on 2023/11/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .always //預設為.automatic
        scrollView.indicatorStyle = .default
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor)
        ])
        
        //contentLayouGuide
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let frameLayoutGuide = scrollView.frameLayoutGuide
        print(frameLayoutGuide)
        var previousLab:UILabel? = nil
        
        for i in 0 ..< 30{
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "This is a Label \(i+1)"
            scrollView.addSubview(lab)
            lab.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
            lab.topAnchor.constraint(equalTo: previousLab?.bottomAnchor ?? scrollView.topAnchor,
                constant: 10).isActive = true
            previousLab = lab
        }
        
        /* contentLayouGuide會自動對齊上,左,右,有需要改變的才要寫
        contentLayoutGuide.topAnchor.constraint(equalTo: frameLayoutGuide.topAnchor).isActive = true
        
        contentLayoutGuide.leadingAnchor.constraint(equalTo: frameLayoutGuide.leadingAnchor).isActive = true
        contentLayoutGuide.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor).isActive = true
        */
        contentLayoutGuide.bottomAnchor.constraint(equalTo: previousLab!.bottomAnchor, constant: 10).isActive = true
        
        
        
        
    }


}

