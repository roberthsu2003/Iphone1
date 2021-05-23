//
//  ViewController.swift
//  lesson11_2
//
//  Created by 徐國堂 on 2021/5/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //取得sandbox的絕對路徑
        let fileManager = FileManager.default
        /*
        if let docsurl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            print(docsurl.path)
        }else{
            print("沒有這個路徑")
        }
 */
        /*
        let docsurl = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        docsurl.path
 */
        
        do{
            let docsurl = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(docsurl.path)
        }catch{
            print("錯誤了")
        }
    }


}

