//
//  ViewController.swift
//  lesson8_3
//
//  Created by 徐國堂 on 2021/6/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var navigationBar:UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if let item = navigationBar.topItem{
            print(item)
        }else{
            print("沒有topItem")
        }
 */
        navigationBar.topItem!.title = "BMI Calulator"
        navigationBar.topItem!.prompt = "計算BMI的小程式"
        navigationBar.topItem!.rightBarButtonItem = UIBarButtonItem(systemItem: .close)
    }


}

