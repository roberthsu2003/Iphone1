//
//  MemberViewController.swift
//  lesson15
//
//  Created by 徐國堂 on 2022/7/20.
//

import UIKit
protocol MemberViewControllerDelegate:AnyObject{
    func receiveNameAndAge(name:String, age:String)
    func cancelData()
}

class MemberViewController: UIViewController {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var ageField:UITextField!
    weak var delegate:MemberViewControllerDelegate?
    
    var kindOfMember:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = kindOfMember
        nameField.delegate = self
        ageField.delegate = self
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
    
    @IBAction func userClickCancel(_ sender:UIButton){
        if let delegate = delegate{
            delegate.cancelData()
        }
    }
    

   

}

extension  MemberViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        print("文字欄位要開始編輯了")
        return true
    }
}
