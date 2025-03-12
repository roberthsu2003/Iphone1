//
//  ViewController.swift
//  lesson8_2
//
//  Created by 徐國堂 on 2025/3/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bundle = Bundle.main
        if let url = bundle.url(forResource: "citylist", withExtension: "plist"){
            do{
                let swiftArray = try NSArray(contentsOf: url, error: ())
                self.cities = swiftArray as? [[String:Any]] ?? [[String:Any]]()
            }catch{
                print(error.localizedDescription)
            }
        }else{
            print("沒有這個檔")
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }


}

