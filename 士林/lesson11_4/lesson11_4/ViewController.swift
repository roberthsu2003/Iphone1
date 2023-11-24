//
//  ViewController.swift
//  lesson11_4
//
//  Created by 徐國堂 on 2023/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //當storyboard的ViewController內的實體已經ready,可以存取裏面的值
        print("ViewDidLoad")
        if view.backgroundColor == nil{
            print("view的背景色,預設是沒有顏色")
        }else{
            print("view有背影色")
        }
        
        //view.backgroundColor = UIColor.systemOrange
        let myLabel = UILabel()
        myLabel.text = "Hello! World!"
        myLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(myLabel)
        myLabel.frame = CGRect(x: 102, y: 183, width: 139, height: 32)
        
    }


}

