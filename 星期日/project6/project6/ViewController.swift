//
//  ViewController.swift
//  project6
//
//  Created by 徐國堂 on 2022/1/9.
//

import UIKit



class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var tableView:UITableView!
    var cities:[[String:Any]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            //false程式區塊
            print("出錯了!沒有這個檔")
            return
        }
       
        if #available(iOS 11.0, *){
            guard let city = try! NSArray(contentsOf: pathURL, error: ()) as? [[String:Any]] else{
                print("轉換錯誤")
                return
            }
            self.cities = city
            
        }else{
            guard let city = NSArray(contentsOf: pathURL) as? [[String:Any]] else{
                print("轉換錯誤")
                return
            }
            self.cities = city
            print("ios2~11以上")
        }
        
        for item in cities{
            if let cityName = item["City"] as? String{
                print(cityName)
            }            
            print("===============")
        }
        
        
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let indexRow =  indexPath.row
        let item = cities[indexRow]
        if #available(iOS 14.0, *){
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            var content = cell.defaultContentConfiguration()
            content.text = item["City"] as? String
            let imageName = item["Image"] as! String
            content.image = UIImage(named: imageName)
            content.imageProperties.reservedLayoutSize = CGSize(width: 80, height: 50)
            cell.contentConfiguration = content
            print("ios14以上")
            return cell
        }else{
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel!.text = item["City"] as? String
            let imageName = item["Image"] as! String
            cell.imageView!.image = UIImage(named: imageName)
            return cell
        }
        
    }


}

