//
//  ThirdViewController.swift
//  3種傳回的方法
//
//  Created by 徐國堂 on 2021/3/31.
//

import UIKit
typealias ThirdViewControllerPostBack = (String,String)->()
class ThirdViewController: UITableViewController {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var passwordField:UITextField!
    var back:ThirdViewControllerPostBack!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func postBack(back:@escaping ThirdViewControllerPostBack){
        self.back = back
    }
    
    @IBAction func userPostBack(_ sender:UIBarButtonItem){
        self.back(nameField.text!,passwordField.text!)
        navigationController?.popViewController(animated: true)
    }

    

}
