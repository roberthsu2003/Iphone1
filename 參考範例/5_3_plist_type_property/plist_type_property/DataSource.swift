//
//  DataSource.swift
//  citys07_07
//
//  Created by Robert on 2019/7/7.
//  Copyright © 2019 ios1. All rights reserved.
//

import Foundation
class DataSource{
        subscript(continent:String) -> [String]?{
        let currentContinents = DataSource.continents;
        if !currentContinents.contains(continent){
            //沒有這個洲
            return nil;
        }
        var selectedCities = [String]();
        for cityDic in DataSource.citys{
            if let cityContinent = cityDic["Continent"] as? String{
                if cityContinent == continent{
                    selectedCities.append(cityDic["City"] as! String)
                }
            }
        }
        return selectedCities;
    }
    
    //type store property
    static var citys:[[String:Any]]! = {
        //default value使用closure的執行，就可以有多行程式
        //只會被執行一次;
        //1.Bundle取得絕對路徑
        guard let urlPath = Bundle.main.url(forResource: "citylist", withExtension: "plist")else{
            return nil
        }
        do{
             let data = try Data(contentsOf: urlPath)
             return try PropertyListSerialization.propertyList(from: data, format: nil) as? [[String:Any]]
        }catch{
            print("讀檔錯誤")
            return nil
        }
        
    }()
    
    private init(){
        
    }
    
    static var names:[String] = {
        //type property,使用default value 的closure
        //只會執行一次
        var names = [String]();
        for cityDic in citys{
            let cityName = cityDic["City"] as! String
            names.append(cityName)
        }
        return names;
    }()
    
    static var continents:[String] = {
        //type property,使用default value 的closure
        //只會執行一次
        var continentNames = Set<String>();
        for cityDic in citys{
            let continentName = cityDic["Continent"] as! String
            continentNames.insert(continentName)
        }
        return continentNames.sorted()
    }()
    
    static var countries:[String] = {
        //type property,使用default value 的closure
        //只會執行一次
        var countryNames = Set<String>();
        for cityDic in citys{
            let countryName = cityDic["Country"] as! String
            countryNames.insert(countryName)
        }
        return countryNames.sorted()
    }()
    
    static var images:[String] = {
        //type property,使用default value 的closure
        //只會執行一次
        var imageNames = Set<String>();
        for cityDic in citys{
            let imageName = cityDic["Image"] as! String
            imageNames.insert(imageName)
        }
        return imageNames.sorted()
    }()
}

