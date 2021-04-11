//
//  ViewController1.swift
//  lesson4_3
//
//  Created by 徐國堂 on 2021/4/11.
//

import UIKit

class ViewController1: UIViewController {
    var myButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        myButton = UIButton(type: .custom)
        myButton.setTitle("Hello! Button", for: .normal)
        myButton.frame = CGRect(x: 100, y: 100, width: 300, height: 45)
        myButton.backgroundColor = UIColor(white: 0.2, alpha: 1)
        myButton.tintColor = UIColor(white: 1.0, alpha: 1)
        view.addSubview(myButton)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
