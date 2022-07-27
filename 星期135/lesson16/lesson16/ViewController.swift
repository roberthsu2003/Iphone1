//
//  ViewController.swift
//  lesson16
//
//  Created by 徐國堂 on 2022/7/27.
//

import UIKit

class ViewController: UIViewController {
    var documentUrl:URL!
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        guard let sourceUrl = Bundle.main.url(forResource: "citylist", withExtension: "plist") else{
            return
        }
        print(sourceUrl.path)
        
        documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("citylist.plist")
        print(documentUrl.path)
        
        //copy檔案
        if !FileManager.default.fileExists(atPath: documentUrl.path){
            if (try? FileManager.default.copyItem(at: sourceUrl, to: documentUrl)) != nil{
                print("copy成功")
            }
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getFile(_ sender:UIButton){
        guard let cities_array = (try? NSArray(contentsOf: documentUrl, error: ())) else{
            return
        }
        guard let cities = cities_array as? [[String:Any]] else{
            return
        }
        self.cities = cities
        
        for city in self.cities{
            print(city["City"]!)
        }
    }


}

