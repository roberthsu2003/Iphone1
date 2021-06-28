//
//  ViewController.swift
//  lesson8_3
//
//  Created by 徐國堂 on 2021/6/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var navigationBar:UINavigationBar!
    @IBOutlet var heightField:UITextField!
    @IBOutlet var weightField:UITextField!
    @IBOutlet var messageView:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageView.text = ""
     
    }
    
    @IBAction func caculate(_ sender:UIButton){
        
        /*
         //optional binding
        if let height = Double(heightField.text!),let weight = Double(weightField.text!){
            
            let bmi = weight/((height/100) * (height/100))
            let bmiString = String(format: "%.2f", bmi)
            messageView.text = "BMI是\(bmiString)"
        }else{
            print("有錯誤")
            return
        }
 */
        //提早離開function
        guard let height = Double(heightField.text!),let weight = Double(weightField.text!) else{
            //false
            print("有錯誤")
            return
        }
        
        let bmi = weight/((height/100) * (height/100))
        let bmiString = String(format: "%.2f", bmi)
        messageView.text = "BMI是\(bmiString)\n"
        switch bmi {
        case 0..<18.5:
            messageView.text += "過輕\n"
        case 18.5..<24:
            messageView.text += "正常\n"
        case 24..<27:
            messageView.text += "過重\n"
        case 27..<30:
            messageView.text += "輕度肥胖\n"
        case 30..<35:
            messageView.text += "中度肥胖\n"
            
        default:
            messageView.text += "中度肥胖\n"
        }
       
        
    }


}

