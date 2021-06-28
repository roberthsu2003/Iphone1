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
        messageView.text = "BMI是\(bmiString)"
        
       
        
    }


}

