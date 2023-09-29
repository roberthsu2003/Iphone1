//
//  ViewController.swift
//  test
//
//  Created by 徐國堂 on 2023/9/27.
//

import UIKit

class ViewController: UIViewController {
    var sv:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Title"
        //try title 文字變大
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let sv = UIScrollView()
        self.sv = sv
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        //設定contentInSet
        //測試.never,.automatic
        
        sv.contentInsetAdjustmentBehavior = .automatic
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo: self.view.topAnchor),
            sv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        let svclg = sv.contentLayoutGuide
        var previousLab:UILabel? = nil
        for i in 0 ..< 30{
            let lab = UILabel()
            lab.backgroundColor = .red
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "這是label\(i+1)"
            sv.addSubview(lab)
            lab.leadingAnchor.constraint(equalTo: svclg.leadingAnchor, constant: 10).isActive = true
            lab.topAnchor.constraint(equalTo: previousLab?.bottomAnchor ?? svclg.topAnchor, constant: 10).isActive = true
            
            previousLab = lab
        }
        svclg.bottomAnchor.constraint(equalTo: previousLab!.bottomAnchor, constant: 10).isActive = true
        
        let svflg = sv.frameLayoutGuide
        //svclg.widthAnchor.constraint(equalTo: svflg.widthAnchor).isActive = true
        sv.delegate = self
        //試驗加上contentInset
        sv.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 100, right: 0)
        
    }
}

extension ViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print("轉動中:\(sv.contentOffset)")
    }
    
    func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        print("did change inset!")
        print("content inset", sv.contentInset)
        //landscape設左邊的inset
        switch scrollView.traitCollection.verticalSizeClass{
        case .compact:
            sv.contentInset = UIEdgeInsets(top: 50, left: 80, bottom: 100, right: 0)
        case .regular:
            sv.contentInset =  UIEdgeInsets(top: 50, left: 0, bottom: 100, right: 0)
        default:break
        }
    }
    
    
}

