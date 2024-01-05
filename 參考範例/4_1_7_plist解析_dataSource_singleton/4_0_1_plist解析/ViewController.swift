//
//  ViewController.swift
//  4_0_1_plist解析
//
//  Created by 徐國堂 on 2023/12/1.
//

import UIKit

class ViewController: UIViewController {
    var cities:[City]
    
    required init?(coder: NSCoder) {
        cities = DataSource.main?.cities ?? [City]()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cities)
    }
    
    @IBAction func save(_ sender:UIButton)
    {
        do
        {
            let fileManager = FileManager.default
            let documentFile = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let cityFile = documentFile.appending(path: "citys.plist", directoryHint: .notDirectory)
            print(cityFile.path(percentEncoded: true))
            let plister = PropertyListEncoder()
            try plister.encode(cities).write(to: cityFile, options: .atomic)
        }
        catch
        {
            print(error)
        }
        
    }
    
    @IBAction func retrive(_ sender:UIButton)
    {
        do
        {
            let fileManager = FileManager.default
            let documentFile = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let cityFile = documentFile.appending(path: "citys.plist", directoryHint: .notDirectory)
            let cityData = try Data(contentsOf: cityFile)
            let cities = try PropertyListDecoder().decode([City].self, from: cityData)
            print(cities)
        }
        catch
        {
            print(error)
        }
    }
   


}

