//
//  ViewController.swift
//  test
//
//  Created by 徐國堂 on 2023/9/13.
//

import UIKit
class MyView:UIView{
    
}

class MyTextField:UITextField{
        var textPadding = UIEdgeInsets(
                top: 10,
                left: 20,
                bottom: 10,
                right: 20
            )

        override func textRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.textRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.editingRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }
}

class ViewController: UIViewController {
    var didSetup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        print("hello!")
        if self.didSetup{
            return
        }
        self.didSetup = true
        let redView = MyView()
        redView.backgroundColor = .red
        self.view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        let grayView = MyView()
        grayView.backgroundColor = .gray
        redView.addSubview(grayView)
        grayView.translatesAutoresizingMaskIntoConstraints = false
        
        print("red view default margins", redView.directionalLayoutMargins)
        var which2:Int{return 1}
        switch which2{
        case 0:
            NSLayoutConstraint.activate([
                redView.topAnchor.constraint(equalTo: self.view.topAnchor),
                redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                redView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                redView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                grayView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                grayView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
                grayView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
                grayView.heightAnchor.constraint(equalToConstant: 50)
                ])
                
        case 1:
            NSLayoutConstraint.activate([
                NSLayoutConstraint.constraints(withVisualFormat: "V:|[redView]|", metrics: nil, views: ["redView":redView]),
                NSLayoutConstraint.constraints(withVisualFormat: "H:|[redView]|", metrics: nil, views: ["redView":redView]),
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-[grayView(50)]", metrics: nil, views: ["grayView":grayView]),
                NSLayoutConstraint.constraints(withVisualFormat: "H:|-[grayView]-|", metrics: nil, views: ["grayView":grayView])
                
            ].flatMap({$0}))
        default:
            break
        }
        
        let hightLabel = UILabel()
        hightLabel.text = "身高:"
        hightLabel.font = UIFont(name: "HelveticaNeue", size: 18)
        hightLabel.textColor = .white
        hightLabel.translatesAutoresizingMaskIntoConstraints = false
        grayView.addSubview(hightLabel)
        
        let hightField = MyTextField()
        hightField.placeholder = "cm"
        hightField.font = UIFont(name: "HelveticaNeue", size: 18)
        hightField.textColor = .white
        hightField.translatesAutoresizingMaskIntoConstraints = false
        hightField.layer.borderWidth = 1
        hightField.layer.borderColor = UIColor.white.cgColor
        grayView.addSubview(hightField)
        
        let btn = UIButton(configuration: .filled())
        btn.configuration?.baseBackgroundColor = .darkGray
        btn.setTitle("計算", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 18)
        btn.translatesAutoresizingMaskIntoConstraints = false
        grayView.addSubview(btn)
        
        var which1:Int{return 0}
        switch which1{
        case 0:
            NSLayoutConstraint.activate([
                hightLabel.leadingAnchor.constraint(equalTo: grayView.layoutMarginsGuide.leadingAnchor),
                hightLabel.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
                hightField.leadingAnchor.constraint(equalTo: hightLabel.trailingAnchor, constant: 10),
                hightField.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
                hightField.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
                btn.leadingAnchor.constraint(equalTo: hightField.trailingAnchor, constant: 20),
                btn.centerYAnchor.constraint(equalTo: grayView.centerYAnchor),
                btn.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
                btn.trailingAnchor.constraint(equalTo: grayView.layoutMarginsGuide.trailingAnchor)
                
            ])
        default:
            break
        }
        
        
        
    }


}

