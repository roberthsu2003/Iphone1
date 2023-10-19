//
//  ViewController.swift
//  lesson17_3
//
//  Created by 徐國堂 on 2023/10/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var views:[UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if let width = self.view.viewWithTag(5)?.frame.width{
            print(width)
        }
         */
        for v in views{
            print(v.tag)
            v.removeFromSuperview()
        }
        /*
        views.map{
            print($0.tag)
        }
         */
        
        let safe = self.view.safeAreaLayoutGuide
        let margin = self.view.layoutMarginsGuide
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safe.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor)
        ])
        
        
    }


}

