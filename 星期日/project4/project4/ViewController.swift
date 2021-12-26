//
//  ViewController.swift
//  project4
//
//  Created by 徐國堂 on 2021/12/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var highTextField:UITextField!
    @IBOutlet var weightTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userClick(_:UIButton){
        /*
        if let heightValue = Int(highTextField.text!), let weightValue = Int(weightTextField.text!){
            
        }
         */
        guard let heightValue = Int(highTextField.text!), let weightValue = Int(weightTextField.text!) else{
            print("輸入有錯誤")
            return
        }
        
        switch (heightValue, weightValue){
        case (50...250, 30...200):
            print("範圍正常")
        default:
            print("超出範圍")
        }
        
        print("身高:\(heightValue)")
        print("體重:\(weightValue)")
    }


}

