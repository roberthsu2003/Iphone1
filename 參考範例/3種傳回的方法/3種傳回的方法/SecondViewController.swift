//
//  SecondViewController.swift
//  3種傳回的方法
//
//  Created by 徐國堂 on 2021/3/31.
//

import UIKit
typealias SecondViewControllerPostBack = (String,String)->()

class SecondViewController: UITableViewController {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var passwordField:UITextField!
    var postBack:SecondViewControllerPostBack!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func userBack(_ sender:UIBarButtonItem){
        postBack(nameField.text!,passwordField.text!)
        self.navigationController?.popViewController(animated: true)
    }

}
