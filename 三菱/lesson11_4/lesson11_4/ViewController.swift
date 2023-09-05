//
//  ViewController.swift
//  lesson11_4
//
//  Created by 徐國堂 on 2023/9/5.
//

import UIKit
class MyView:UIView{
    var which:Int{
        return 3
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //用程式自訂
        switch which{
        case 1:
            let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
                    v1.backgroundColor = UIColor.red
            
            let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = .gray
            
            self.addSubview(v1)
            v1.addSubview(v2)
            
        case 2:
            let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
                    v1.backgroundColor = UIColor.red
            
            let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = .gray
            
            self.addSubview(v1)
            v1.addSubview(v2)
            v2.bounds.size.width += 20
            v2.bounds.size.height += 20
            
        case 3:
            let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
                    v1.backgroundColor = UIColor.red
            
            let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
            v2.backgroundColor = .gray
            
            self.addSubview(v1)
            v1.addSubview(v2)
            v2.center.y += 10
            v2.center.x += 10
            
            
        default:
            break
        }
        
    }
}

class ViewController: UIViewController {
    @IBOutlet var outterView:MyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

