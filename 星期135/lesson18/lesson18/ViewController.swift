//
//  ViewController.swift
//  lesson18
//
//  Created by 徐國堂 on 2022/8/5.
//

import UIKit

class ViewController: UITableViewController{
    let httpString = "https://flask-robert.herokuapp.com/youbike/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func user_download(_ sender:UIButton){
        guard let url = URL(string: httpString) else{
            return
        }
        let downloadTask = URLSession.shared.downloadTask(with: url)
    }


}

