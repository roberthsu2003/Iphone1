//
//  ViewController.swift
//  程式建立UIScroller_constraints
//
//  Created by 徐國堂 on 2023/9/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.systemGray
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        let safeguide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo: safeguide.topAnchor),
            sv.bottomAnchor.constraint(equalTo: safeguide.bottomAnchor),
            sv.leadingAnchor.constraint(equalTo: safeguide.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo: safeguide.trailingAnchor)
        ])
        
        var previousLab:UILabel? = nil
        for i in 0 ..< 30{
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "這是label \(i+1)"
            sv.addSubview(lab)
            lab.leadingAnchor.constraint(equalTo: sv.leadingAnchor, constant: 10).isActive = true
            lab.topAnchor.constraint(equalTo: previousLab?.bottomAnchor ?? sv.topAnchor,
                                     constant: 10).isActive = true
            previousLab = lab
            
        }
        //一定要下面這個才會自動建立UIScrollView的content size
        sv.bottomAnchor.constraint(equalTo: previousLab!.bottomAnchor,constant: 10).isActive = true
    }


}

