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
        /*
        let safeLayoutGuid = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeLayoutGuid.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeLayoutGuid.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeLayoutGuid.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeLayoutGuid.bottomAnchor)
        ])
         */
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.contentInsetAdjustmentBehavior = .always
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title =
        title = "我的Title"
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.navigationBar.tintColor = .blue
        let contentLayoutGuide = scrollView.contentLayoutGuide
        //let safeLayoutGuid = view.safeAreaLayoutGuide
        var previousLabel:UILabel? = nil
        for i in 0..<50{
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "這是Label \(i+1)"
            scrollView.addSubview(lab)
            //lab.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            lab.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
            lab.topAnchor.constraint(equalTo: previousLabel?.bottomAnchor ?? scrollView.topAnchor,
                                     constant: 20).isActive = true
            
            previousLabel = lab
        }
        /*
        NSLayoutConstraint.activate([
            contentLayoutGuide.topAnchor.constraint(equalTo: safeLayoutGuid.topAnchor),
            contentLayoutGuide.trailingAnchor.constraint(equalTo: safeLayoutGuid.trailingAnchor),
            contentLayoutGuide.leadingAnchor.constraint(equalTo: safeLayoutGuid.leadingAnchor),
            contentLayoutGuide.bottomAnchor.constraint(equalTo: previousLabel!.bottomAnchor, constant: 20)
        ])*/
        contentLayoutGuide.bottomAnchor.constraint(equalTo: previousLabel!.bottomAnchor, constant: 20).isActive = true
        //scrollView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
       
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self.scrollView.contentLayoutGuide)
        print("========================")
        print(self.scrollView.frameLayoutGuide)
    }


}

