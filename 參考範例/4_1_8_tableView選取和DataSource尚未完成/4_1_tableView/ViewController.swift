//
//  ViewController.swift
//  4_1_tableView
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit

//檢查documents有沒有檔案,沒檔案,讀bundle檔,轉換檔案,並存檔
//檢查documents有沒有檔案,有檔案,讀檔案

class ViewController: UIViewController {
    var cities = [City]()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        do{
            let fileManager = FileManager.default
            let documentURL = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = documentURL.appending(path: "citylist.plist", directoryHint: .inferFromPath)
            if !fileManager.fileExists(atPath: fileURL.path()){
                //檔案不存在
                print("檔案不存在")
                guard let cities2 = readBundleFile() else{
                    return
                }
                self.cities = parseCity(cities: cities2)
                saveCityToDocuments(cities: self.cities)
            }else{
                //有檔案存在
                let plister = PropertyListDecoder()
                let data = try Data(contentsOf: fileURL)
                self.cities = try plister.decode([City].self, from: data)
                
            }
        }catch{
            print(error)
        }
        
    }
    
    func readBundleFile() -> [[String:Any]]?{
        var cities3 = [[String:Any]]()
        guard let sourcePath = Bundle.main.url(forResource: "citylist", withExtension: "plist") else
        {
            print("Bundle解析錯誤")
            return nil
        }
        do
        {
            let sourceData = try Data(contentsOf: sourcePath)
            cities3 = try PropertyListSerialization.propertyList(from: sourceData, format: nil) as? [[String:Any]] ?? [[String:Any]]()
        }
        catch
        {
            print(error)
        }
        return cities3
    }
    
    func parseCity(cities:[[String:Any]])->[City]{
        //轉換[[String:Any]])->[City]
        var cities1 = [City]()
        for item in cities{
            let cityName = item["City"] as? String ?? "空的"
            let continent = item["Continent"] as? String ?? "空的"
            let country = item["Country"] as? String ?? "空的"
            let image = item["Image"] as? String ?? "空的"
            let local = item["Local"] as? String ?? "空的"
            let lat = item["lat"] as? Double ?? 0.0
            let long = item["long"] as? Double ?? 0.0
            let url = item["url"] as? String ?? "空的"
            let city = City(city: cityName, continent: continent, country: country, image: image, local: local, lat: lat, long: long, url: url)
            cities1.append(city)
        }
        return cities1
    }
    
    func saveCityToDocuments(cities:[City]){
        do{
            let fileManager = FileManager.default
            let documentFile = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(documentFile)
            let cityFile = documentFile.appending(path: "citys.plist", directoryHint: .notDirectory)
            let plister = PropertyListEncoder()
            try plister.encode(cities).write(to: cityFile, options: .atomic)
        }catch{
            print(error)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(cities)
    }


}

