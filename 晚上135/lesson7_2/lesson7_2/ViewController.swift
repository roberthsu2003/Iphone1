//
//  ViewController.swift
//  lesson7_2
//
//  Created by 徐國堂 on 2021/6/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputNum:UITextField!
    @IBOutlet var message:UITextView!
    
    var numbers = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        message.text = ""
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
        var messageString = ""
        for num in numbers{
            messageString += "\(num)\n"
        }
        message.text = messageString
        
    }


}

