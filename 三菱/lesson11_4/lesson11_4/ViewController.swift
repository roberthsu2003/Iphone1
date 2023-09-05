//
//  ViewController.swift
//  lesson11_4
//
//  Created by 徐國堂 on 2023/9/5.
//

import UIKit
class MyView:UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        //用程式自訂
        let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
                v1.backgroundColor = UIColor.red
        
        let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = .gray
        
        self.addSubview(v1)
        v1.addSubview(v2)
    }
}

class ViewController: UIViewController {
    @IBOutlet var outterView:MyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

