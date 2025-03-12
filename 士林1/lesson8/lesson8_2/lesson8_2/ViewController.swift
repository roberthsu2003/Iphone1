//
//  ViewController.swift
//  lesson8_2
//
//  Created by 徐國堂 on 2025/3/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }


}

