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
    @IBOutlet var mySwitch:UISwitch!
    
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
        
        let sortedNumbers = numbers.sorted { (s1:Int, s2:Int) -> Bool in
            return s1 > s2;
        }
        
        var messageString = ""
        for num in sortedNumbers{
            messageString += "\(num)\n"
        }
        message.text = messageString
        
        if mySwitch.isOn{
            print("打開")
        }else{
            print("關閉")
        }
        
    }


}

