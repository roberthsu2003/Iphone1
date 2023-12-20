//
//  ViewController.swift
//  test
//
//  Created by 徐國堂 on 2023/12/14.
//

import UIKit

class ViewController: UIViewController {
    //CoCoa class 提供4個class,可以使用write
    //1.NSString, 2.NSData, 3.NSArray, 4.NSDictionary

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
    //CoCoa class 提供4個class,可以使用write
    //1.NSString, 2.NSData, 3.NSArray, 4.NSDictionary
    //如以下func doButton3,如以下 func doButton6
    
    @IBAction func doButton3(_ sender:Any){
        //NSString 儲存檔案
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
        //搜尋該目錄下所有的檔案
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
        //Array 儲存檔案
        print("測試儲存array成為檔案")
        let array = ["Manny", "Moe", "Jack"]
        let fileManger = FileManager.default.temporaryDirectory
        let fileURL = fileManger.appending(path: "pep.plist", directoryHint: .inferFromPath)
        if (array as NSArray).write(to: fileURL, atomically: true){
            print("存檔成功")
        }
        
    }
    //NSCoding protocol
    //採納NSCoding,可以將物件轉成NSData
    //採納NSCoding,實作 encode(with:), init(coder:)
    //ios12後建議採納NSSecureCoding,為了防止被攻擊
    
    @IBAction func doButton7(_ sender:UIButton)
    {
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            print("使用property list encoder序列化Person")
            let user1 = Person(firstName: "徐", lastName: "國堂")
            let user1Data = try PropertyListEncoder().encode(user1)
            let user1file = documentURL.appendingPathComponent("user1.plist")
            try user1Data.write(to: user1file, options: .atomic)
        }catch{
            print(error)
        }
    }
    
    @IBAction func doButton8(_ sender:UIButton)
    {
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            print("使用property list encoder序列化Person")
            let user1 = Person(firstName: "徐", lastName: "國堂")
            let user2 = Person(firstName: "Robert", lastName: "Hsu")
            let plister = PropertyListEncoder()
            //plister.outputFormat = .xml
            let arrUser = [user1, user2]
            let userFile = documentURL.appendingPathComponent("user.plist")
            try plister.encode(arrUser).write(to: userFile, options: .atomic)
            
        }catch{
            print(error)
        }
    }
    
    
    


}

