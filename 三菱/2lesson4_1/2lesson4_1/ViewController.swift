//
//  ViewController.swift
//  2lesson4_1
//
//  Created by 徐國堂 on 2023/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doButton1(_ sender:UIButton){
        let docs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(docs.last ?? "沒有路徑")
    }
    
    @IBAction func doButton2(_ sender:UIButton){
        let fileManager = FileManager.default
        if let documentURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            print("Document的目錄(url)\(documentURL)")
            print("Document的目錄(字串)\(documentURL.path())")
        }
        
    }

}

