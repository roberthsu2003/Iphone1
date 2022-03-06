//
//  FormViewController.swift
//  lesson14
//
//  Created by 徐國堂 on 2022/3/6.
//

import UIKit

class FormViewController: UITableViewController {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var passwordField:UITextField!
    
    var titleName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleName
    }
    
    @IBAction func userBack(_ sender:UIBarButtonItem){
        navigationController?.popViewController(animated: true)
    }

    
}
