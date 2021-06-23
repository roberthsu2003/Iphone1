//
//  ViewController.swift
//  lesson7_2
//
//  Created by 徐國堂 on 2021/6/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputNum:UITextField!
    var numbers = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userClick(_ sender:UIButton){
        let num = inputNum.text!
                
        //optional binding
        if let convertedNum = Int(num){
            numbers.append(convertedNum)
        }else{
            print("轉換失敗")
        }
        
        inputNum.text = "";
        print(numbers)
        
    }


}

