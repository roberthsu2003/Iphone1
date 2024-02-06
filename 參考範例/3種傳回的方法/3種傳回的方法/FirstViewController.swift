//
//  FirstViewController.swift
//  3種傳回的方法
//
//  Created by 徐國堂 on 2021/3/31.
//

import UIKit
protocol FirstViewControllerDelegate:NSObject {
    func postBack(name:String,password:String);
}

class FirstViewController: UITableViewController {
    @IBOutlet var nameField:UITextField!
    @IBOutlet var passwordField:UITextField!
    weak var delegate:FirstViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func userBack(_ sender:UIBarButtonItem){
        delegate?.postBack(name: nameField.text!, password: passwordField.text!)
        self.navigationController?.popViewController(animated: true)
    }

    

}
