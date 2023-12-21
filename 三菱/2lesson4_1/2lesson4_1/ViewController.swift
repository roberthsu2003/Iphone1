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
    
    @IBAction func doButton3(_ sender:UIButton)
    {
        //String的儲存
        do
        {
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            //print("Document的目錄(url)\(documentURL)")
            
            let folder = "MyFolder"
            let myName1 = "robert"
            let myName2 = "徐國堂"
            let myFolderURL = documentURL.appending(path:folder , directoryHint: .isDirectory)
            try fileManager.createDirectory(at: myFolderURL, withIntermediateDirectories: true)
            
            let myName1URL = myFolderURL.appending(path: "name1.txt", directoryHint: .inferFromPath)
            let myName2URL = myFolderURL.appending(path: "name2.txt", directoryHint: .inferFromPath)
            try myName1.write(to: myName1URL, atomically: true, encoding: .utf8)
            try myName2.write(to: myName2URL, atomically: true, encoding: .utf8)
            print("存檔成功")
            print("Document的目錄(字串)\(documentURL.path())")
        }
        catch
        {
            print(error)
        }
    }
    
    @IBAction func doButton4(_ sender:UIButton){
        do
        {
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("Document的目錄(字串)\(documentURL.path())")
            let infoArray = try fileManager.contentsOfDirectory(at: documentURL, includingPropertiesForKeys: nil)
            print("documents目錄內的資料")
            infoArray.forEach 
            { itemURL in
                let foldersURL = itemURL
                print(foldersURL.path())
                do{
                    let infoArray = try fileManager.contentsOfDirectory(at: foldersURL, includingPropertiesForKeys: nil)
                    infoArray.forEach 
                    {
                        print($0.path())
                    }
                    
                    
                }catch{
                    print(error)
                }
                
            
            }
            
        }
        catch
        {
            print(error)
        }
        
    }
    
    @IBAction func doButton5(_ sender:UIButton)
    {
        //String的儲存
        do
        {
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            //print("Document的目錄(url)\(documentURL)")
            let dir = fileManager.enumerator(at: documentURL, includingPropertiesForKeys: nil)!
            /*
            for case let f as URL in dir where f.pathExtension == "txt"{
                print(f)
            }
             */
            for case let f as URL in dir where f.pathExtension == "txt"{
                print(f)
            }
            
        }
        catch
        {
            print(error)
        }
    }
    
    @IBAction func doButton6(_ sender:UIButton)
    {
        //String的儲存
        do
        {
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("Document的目錄\(documentURL.path())")
            
            let fileURL = documentURL.appending(path: "pep.plist", directoryHint: .inferFromPath)
            let array = ["robert","徐國堂","巨匠"]
            if (array as NSArray).write(to: fileURL, atomically: true){
                print("轉換和存檔成功")
                
            }
            
            let dict = ["name":"徐國堂","address":"台北市","code":12345] as [String:Any]
            let fileURL1 = documentURL.appending(path: "pep1.plist", directoryHint: .inferFromPath)
            try (dict as NSDictionary).write(to: fileURL1)
        
            
        }
        catch
        {
            print(error)
        }
    }
    
    @IBAction func doButton7(_ sender:UIButton)
    {
        //String的儲存
        do
        {
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("Document的目錄\(documentURL.path())")
            let pepURL = documentURL.appending(path: "pep.plist", directoryHint: .inferFromPath)
            let pep1URL = documentURL.appending(path: "pep1.plist", directoryHint: .inferFromPath)
            let pepData = try Data(contentsOf: pepURL)
            if let pep = try PropertyListSerialization.propertyList(from: pepData, format: nil) as? [String]{
                print(pep)
            }
            let pep1Data = try Data(contentsOf: pep1URL)
            
            if let pep1 = try PropertyListSerialization.propertyList(from: pep1Data, format: nil) as? [String:Any]{
                let address = pep1["address"] as? String ?? ""
                let code = pep1["code"] as? Int ?? 0
                let name = pep1["name"] as? String ?? ""
                print(address, code, name)
            }
        
            
        }
        catch
        {
            print(error)
        }
    }
}

