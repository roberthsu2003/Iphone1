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
        //取得mainBundle內的絕路徑
        guard let sourceUrl = Bundle.main.url(forResource: "citylist", withExtension: "plist")else{
            print("沒有bundle內的plist")
            return
        }
        
        
        //取得sandbox的絕對路徑
        let fileManager = FileManager.default
        
        guard let docsurl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)else{
            print("出錯了")
            return
        }
        print(docsurl.path)
        let targetFileURL = docsurl.appendingPathComponent("city.plist")
        
         if !fileManager.fileExists(atPath: targetFileURL.path){
            print("沒有這個檔")
            //copy檔案進來
            do{
                try fileManager.copyItem(at: sourceUrl, to: targetFileURL)
                print("copy檔案成功")
            }catch{
                print("copy錯誤")
            }
            
            
         }else{
            print("有這個檔")
            //不用copy
         }
        
        
        let cities = NSArray(contentsOf: targetFileURL) as! [[String:Any]]
        print(cities)
        
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

