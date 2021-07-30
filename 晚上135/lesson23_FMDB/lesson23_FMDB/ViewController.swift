//
//  ViewController.swift
//  lesson23_FMDB
//
//  Created by 徐國堂 on 2021/7/30.
//

import UIKit

class ViewController: UIViewController {
    
    func copySQLiteToDocuments(){
        let sourceURL = Bundle.main.url(forResource: "citys", withExtension: "db")!
        let fileManager = FileManager.default
        guard var targetURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
            print("targetURL路徑取得錯誤")
            return
        }
        
        print(targetURL.path)
        targetURL.appendPathComponent("citys.db")
        
        if !fileManager.fileExists(atPath: targetURL.path){
            if let _ = try? fileManager.copyItem(at: sourceURL, to:targetURL){
                print("copy 成功")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        copySQLiteToDocuments()
    }


}

