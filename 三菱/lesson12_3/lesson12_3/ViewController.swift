//
//  ViewController.swift
//  lesson12_3
//
//  Created by 徐國堂 on 2023/9/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var heightField:UITextField!
    @IBOutlet var btn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightField.placeholder = "cm"
        btn.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        heightField.addTarget(self, action: #selector(beginEdit(_:)), for: .editingDidBegin)
        
    }
    
    @objc func onClick(_ sender:UIButton){
        if heightField.text != "" {
            let heightValue = Int(heightField.text ?? "0")
            print(heightValue!)
        }else{
            print("不可以是空字串")
        }
        
        
    }
    
    @objc func beginEdit(_ sender:UITextField){
        print("開始編輯")
    }


}

