//
//  ViewController.swift
//  2lesson10_2
//
//  Created by 徐國堂 on 2024/1/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doButton7(_ sender:UIButton){
        print("doButton7")
        let person1 = Person(firstName: "國堂", lastName: "徐")
        let person2 = Person(firstName: "徐", lastName: "國堂")
        let userArray:[Person] = [person1,person2]
        print(userArray)
        
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            print(documentURL)
            let userFileURL = documentURL.appending(path: "user.plist")
            let plistEncoder = PropertyListEncoder()
            let userArrayData:Data = try plistEncoder.encode(userArray)
            try userArrayData.write(to: userFileURL, options: .atomic)
            
        }catch{
            print(error)
        }
    }
    
    @IBAction func doButton8(_ sender:UIButton){
        
    }


}

