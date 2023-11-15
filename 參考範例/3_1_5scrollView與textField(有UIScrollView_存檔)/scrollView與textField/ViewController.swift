//
//  ViewController.swift
//  scrollView與textField
//
//  Created by 徐國堂 on 2023/11/8.
//

import UIKit
import PhotosUI

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var addressField:UITextField!
    @IBOutlet var phoneField:UITextField!
    @IBOutlet var emailField:UITextField!
    @IBOutlet var passwordField:UITextField!
    @IBOutlet var confirmField:UITextField!
    @IBOutlet var photoImageView:UIImageView!
    
    @IBOutlet var scrollView:UIScrollView!
    weak var activeField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboarDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //取出資料
        if let name = UserDefaults.standard.string(forKey: "name"){
            nameField.text = name
        }
        
        if let address = UserDefaults.standard.string(forKey: "address"){
            addressField.text = address
        }
        
        if let phone = UserDefaults.standard.string(forKey: "phone"){
            phoneField.text = phone
        }
        
        if let email = UserDefaults.standard.string(forKey: "email"){
            emailField.text = email
        }
        
        if let password = UserDefaults.standard.string(forKey: "password"){
            passwordField.text = password
        }
        
        if let confirm = UserDefaults.standard.string(forKey: "confirm"){
            confirmField.text = confirm
        }
        
        //取出圖片
        if let imageData = UserDefaults.standard.data(forKey: "image"){
            photoImageView.image = UIImage(data: imageData)
        }
    }
    
    @IBAction func userClick(_ sender:UIButton){
        let name = nameField.text
        let address = addressField.text
        let phone = phoneField.text
        let email = emailField.text
        let password = passwordField.text
        let confirm = confirmField.text
        UserDefaults.standard.setValue(name, forKey: "name")
        UserDefaults.standard.setValue(address, forKey: "address")
        UserDefaults.standard.setValue(phone, forKey: "phone")
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.setValue(password, forKey: "password")
        UserDefaults.standard.setValue(confirm, forKey: "confirm")
        if let imageData = photoImageView.image?.pngData(){
            UserDefaults.standard.setValue(imageData, forKey: "image")
        }
        UserDefaults.standard.synchronize()
        let fileManager = FileManager.default
        if let docsurl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            print(docsurl.path())
        }
    }
    
    @IBAction func imageChange(_ sender:UIButton){
        let config = PHPickerConfiguration()
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    @IBAction func removeImage(_ sender:UIButton){
        photoImageView.image = UIImage(named: "IMG_0064")
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

extension ViewController:PHPickerViewControllerDelegate{
    func picker(
        _ picker: PHPickerViewController,
        didFinishPicking results: [PHPickerResult]
    ){
        if let result = results.first{
            result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage{
                    DispatchQueue.main.async {
                        self.photoImageView.image = image
                    }
                    
                }
            }
        }
        picker.dismiss(animated: true)
    }
}

