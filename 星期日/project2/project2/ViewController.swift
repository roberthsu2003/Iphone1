//
//  ViewController.swift
//  project2
//
//  Created by alicehsu on 2021/12/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myLabel!.text!)
        print(myLabel!.text ?? "text內容是nil")
    }


}

