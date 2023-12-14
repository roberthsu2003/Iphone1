//
//  ViewController.swift
//  test
//
//  Created by 徐國堂 on 2023/12/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doButton(_ sender:Any){
        let docs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let documentPath = docs.last{
            print("document的目錄\(documentPath)")
        }
        
    }
    
    @IBAction func doButton1(_ sender:UIButton){
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("document的目錄(url)\(documentURL)")
            print("document的目錄(字串)\(documentURL.path())")
        }catch{
            print(error)
        }
    }
    
    @IBAction func doButton2(_ sender:UIButton){
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .applicationSupportDirectory,  in: .userDomainMask, appropriateFor: nil, create: false)
            print("application support的目錄(url)\(documentURL)")
            print("application support的目錄(string)\(documentURL.path())")
        }catch{
            print(error)
        }
    }
    
    @IBAction func doButton3(_ sender:Any){
        do{
            let foldername = "MyFolder"
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let myFolder = documentURL.appending(path: foldername, directoryHint: .isDirectory)
            try fileManager.createDirectory(at: myFolder, withIntermediateDirectories: true)
            
            try "howdy".write(to: myFolder.appending(path: "file1.txt", directoryHint: .inferFromPath), atomically: true, encoding: .utf8)
            try "greeting".write(to: myFolder.appending(path: "file2.txt", directoryHint: .inferFromPath), atomically: true, encoding: .utf8)
            print("ok")
         
        }catch{
            print(error)
        }
    }
    
    @IBAction func doButton4(_ sender:UIButton){
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let arr = try fileManager.contentsOfDirectory(at: documentURL, includingPropertiesForKeys: nil)
            arr.forEach {
                print($0.lastPathComponent)
            }
            
        }catch{
            print(error)
        }
    }
    
    @IBAction func doButton5(_ sender:Any){
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let dir = fileManager.enumerator(at: documentURL, includingPropertiesForKeys: nil)!
            for case let f as URL in dir where f.pathExtension == "txt"{
                print(f)
            }
            
        }catch{
            print("error")
        }
    }
    
    @IBAction func doButton6(_ sender:UIButton){
        print("測試儲存array成為檔案")
        let array = ["Manny", "Moe", "Jack"]
        let fileManger = FileManager.default.temporaryDirectory
        let fileURL = fileManger.appending(path: "pep.plist", directoryHint: .inferFromPath)
        if (array as NSArray).write(to: fileURL, atomically: true){
            print("存檔成功")
        }
        
    }


}

