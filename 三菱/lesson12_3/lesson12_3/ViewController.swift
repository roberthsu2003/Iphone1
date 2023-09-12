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
        
    }
    
    @objc func onClick(_ sender:UIButton){
        let heightValue = Int(heightField.text ?? "0")
        print(heightValue!)
        
    }


}

