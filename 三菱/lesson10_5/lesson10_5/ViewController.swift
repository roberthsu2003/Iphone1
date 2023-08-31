//
//  ViewController.swift
//  lesson10_5
//
//  Created by 徐國堂 on 2023/8/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = UIView(frame: CGRect(x: 113, y: 111, width: 132, height: 194))
        /*
        v1.backgroundColor = UIColor{
            (tc:UITraitCollection) -> UIColor in
            switch tc.userInterfaceStyle{
            case .dark:
                return UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            default:
                return UIColor(red: 0, green: 0.1, blue: 0.1, alpha: 1)
            }
            
          }
         */
        /*
        v1.backgroundColor = UIColor{
        tc in
            switch tc.userInterfaceStyle{
            case .dark:
                return UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            default:
                return UIColor(red: 0, green: 0.1, blue: 0.1, alpha: 1)
            }
            
          }
         */
        v1.backgroundColor = UIColor(dynamicProvider: { (tc:UITraitCollection) in
            switch tc.userInterfaceStyle{
            case .dark:
                return UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            default:
                return UIColor(red: 0, green: 0.1, blue: 0.1, alpha: 1)
            }
            
        })
        view.addSubview(v1)
        
        let v2 = UIView(frame: CGRect(x: 41, y: 56, width: 136, height: 194))
        v2.backgroundColor = UIColor(named: "myColor")
        
        v1.addSubview(v2)
    }


}

