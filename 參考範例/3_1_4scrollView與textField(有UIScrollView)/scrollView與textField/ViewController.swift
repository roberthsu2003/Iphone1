//
//  ViewController.swift
//  scrollView與textField
//
//  Created by 徐國堂 on 2023/11/8.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var scrollView:UIScrollView!
    weak var activeField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboarDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    @objc func keyboarDidShow(_ notification:Notification){
        print("keyboardDidShow")
        //要用keyboardFrameEndUserInfoKey,不要用begin
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        guard let activeField = activeField, let keyboardHeight = keyboardSize?.height else{
            return
        }
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        let activeRect = activeField.convert(activeField.bounds, to:scrollView)
        scrollView.scrollRectToVisible(activeRect, animated: true)
        
    }
    
    @objc func keyboardWillBeHidden(_ notification:Notification){
        print("keyboardDidHide")
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //使用者按了確定後,要讓鍵盤向下隱藏
        print("textFieldResignFirstResponder")
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }

}

