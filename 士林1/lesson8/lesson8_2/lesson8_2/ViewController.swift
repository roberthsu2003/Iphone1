//
//  ViewController.swift
//  lesson8_2
//
//  Created by 徐國堂 on 2025/3/12.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
   
    
    @IBOutlet var tableView: UITableView!
    var cities:[[String:Any]]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let url = Bundle.main.url(forResource: "citylist", withExtension: "plist"){
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
        tableView.dataSource = self
    }
    //UITableViewDataSource
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = "Hello, World_\(indexPath.row)"
        return cell
    }


}

