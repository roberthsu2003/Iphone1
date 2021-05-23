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
        
        guard let docsurl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)else{
            print("出錯了")
            return
        }
        let targetFileURL = docsurl.appendingPathComponent("city.plist")
        
         if !fileManager.fileExists(atPath: targetFileURL.path){
            print("沒有這個檔")
            //copy檔案進來
            
         }else{
            print("有這個檔")
            //不用copy
         }
       
        /*
        let docsurl = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        docsurl.path
 */
        /*
        
        do{
            let docsurl = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(docsurl.path)
        }catch{
            print("錯誤了")
        }
 */
    }


}

