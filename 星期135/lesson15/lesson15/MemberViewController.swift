//
//  MemberViewController.swift
//  lesson15
//
//  Created by 徐國堂 on 2022/7/20.
//

import UIKit
protocol MemberViewControllerDelegate:AnyObject{
    func receiveNameAndAge(name:String, age:String)
}

class MemberViewController: UIViewController {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var ageField:UITextField!
    weak var delegate:MemberViewControllerDelegate?
    
    var kindOfMember:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = kindOfMember
    }
    
    @IBAction func sendName(_ sender:UIButton){
        let name = nameField.text ?? ""
        let age = ageField.text ?? ""
       
        if let delegate = delegate{
            delegate.receiveNameAndAge(name: name, age: age)
        }else{
            print("傳送失敗")
        }
    }
    

   

}
