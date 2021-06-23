//
//  ViewController.swift
//  lesson7_2
//
//  Created by 徐國堂 on 2021/6/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputNum:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userClick(_ sender:UIButton){
        let num = inputNum.text!
        /*
        let convertedNum = Int(num)
        if convertedNum == nil{
            print("轉換失敗")
        }else{
            print("數值是\(convertedNum!)")
        }
        */
        
        //optional binding
        if let convertedNum = Int(num){
            print("數值是\(convertedNum)")
        }else{
            print("轉換失敗")
        }
        
        
    }


}

