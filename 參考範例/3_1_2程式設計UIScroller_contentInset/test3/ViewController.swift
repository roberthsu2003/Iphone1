//
//  ViewController.swift
//  test3
//
//  Created by 徐國堂 on 2023/11/23.
//

import UIKit

class ViewController: UIViewController {
    var scrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Title"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //對齊safeAreaLayoutGuide最安全
        //contentLayoutGuide不會自動產生
        scrollView.contentInsetAdjustmentBehavior = .never
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        /*
         //對齊view的layoutAnchor
         //contentLayoutGuide會自動產生inset
         //viewDidLayoutSubView()內檢查inset
         scrollView.contentInsetAdjustmentBehavior = .never
         NSLayoutConstraint.activate([
             scrollView.topAnchor.constraint(equalTo: view.topAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
         ])
         
         */
         
         
        var previousLab:UILabel? = nil
        for i in 0 ..< 50{
            let label = UILabel()
            label.backgroundColor = .red
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "這是label\(i+1)"
            scrollView.addSubview(label)
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
            label.topAnchor.constraint(equalTo: previousLab?.bottomAnchor ?? scrollView.topAnchor, constant: 10).isActive = true
            previousLab = label
        }
        //只要設定contentLayoutGuide的bottom就可以了
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: previousLab!.bottomAnchor).isActive = true
        //測試contentInset
        //scrollView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
       
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //檢查contentLayout和frameLayouGiude的大小
        print(scrollView.contentLayoutGuide)
        print("==========================")
        print(scrollView.frameLayoutGuide)
    }
    
    


}

