//
//  ViewController.swift
//  lesson14_2
//
//  Created by 徐國堂 on 2023/9/19.
//

import UIKit


class ViewController: UIViewController {
    var n:Int
    var v1:UIView!
    
    required init?(coder: NSCoder) {
        self.n = 5
        super.init(coder: coder)
        print(self.n)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //v1要使用自動產生constraints
        v1 = UIView(frame: CGRect(x: 100, y: 111, width: 132, height: 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        
        
        let v2 = UIView()
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        //v2請不要自動產生autoresing的contraints
        v2.translatesAutoresizingMaskIntoConstraints = false
        
        let v3 = UIView()
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        v3.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        self.view.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        
        v1.addConstraint(NSLayoutConstraint(item: v1!,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: v2,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: 0))
        v1.addConstraint(NSLayoutConstraint(item: v1!,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: v2,
                                            attribute: .leading,
                                            multiplier: 1,
                                            constant: 0))
        v1.addConstraint(NSLayoutConstraint(item: v1!,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: v2,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: 0))
        v2.addConstraint(NSLayoutConstraint(item: v2,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1,
                                            constant: 10))
        
        v1.addConstraint(NSLayoutConstraint(item: v1!,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: v3,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: 0))
        
        v1.addConstraint(NSLayoutConstraint(item: v1!,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: v3,
                                            attribute: .bottom,
                                            multiplier: 1,
                                            constant: 0))
        
        v3.addConstraint(NSLayoutConstraint(item: v3,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1,
                                            constant: 20))
        
        v3.addConstraint(NSLayoutConstraint(item: v3,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1,
                                            constant: 20))
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(2, closure: {
            self.v1.bounds.size.width += 40
            self.v1.bounds.size.height -= 50
        
        })
    }


}

