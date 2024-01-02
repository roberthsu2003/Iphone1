//
//  dataSource.swift
//  4_1_5_tableView
//
//  Created by 徐國堂 on 2024/1/2.
//

import Foundation
//singleton class
class DataSource{
    private init(){
        
    }
    
    static var states:[String:[String]] = {
        do{
            let fileManager = FileManager()
            let filePath = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(filePath.path())
            let plistFile = filePath.appending(path: "statedictionary.plist", directoryHint: .inferFromPath)
            //檢查檔案是否存在,不存在,移動plist至documents內
            if !fileManager.fileExists(atPath: plistFile.path()){
                if let bundleListPath = Bundle.main.url(forResource: "statedictionary", withExtension: "plist"){
                    try fileManager.moveItem(at: bundleListPath, to: plistFile)
                }
            }
            let plistData = try Data(contentsOf: plistFile)
            
            let returnData = try PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String:[String]]
            return returnData!
            
        }catch{
            print(error)
            return [String:[String]]()
        }
        
    }()
}
