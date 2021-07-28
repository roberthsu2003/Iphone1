//
//  ViewController.swift
//  lesson13_2
//
//  Created by 徐國堂 on 2021/7/7.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    
    var targetURL:URL = {
        let fileManager = FileManager.default
        guard  var targetURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
            print("targetURL路徑取得錯誤")
            return URL(string: "hello")!
        }
        
        targetURL.appendPathComponent("citylist.plist")
        print(targetURL.path)
        return targetURL
    }()
    
    lazy var cities:[[String:Any]] = {
        let sourceURL = Bundle.main.url(forResource: "citylist", withExtension: "plist")!
        //let targetString = NSHomeDirectory()
        let fileManager = FileManager.default
        //檢查Documents有沒有這個檔案
        if !fileManager.fileExists(atPath: self.targetURL.path){
            if let _ = try? fileManager.copyItem(at: sourceURL, to: self.targetURL){
                print("copy 成功")
            }
        }
        let tempArray = NSArray(contentsOf: targetURL) as? [[String:Any]]
        
        
        return tempArray ?? [[String:Any]]()
    }()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goDetail"{
            let city = sender as! City
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.city = city
            
        }
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        //檢查使用者是否註冊
        let userDefaults = UserDefaults.standard
        if let _ = userDefaults.object(forKey: "name"){
            navigationItem.rightBarButtonItem = nil
        }else{
            //建立UIBarButtonItem
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "註冊", style: .plain, target: self, action: #selector(userClickRegister(_:)))
        }
       
    }
    
    
    @objc func userClickRegister(_ sender:UIBarButtonItem){
        performSegue(withIdentifier: "goRegister", sender: nil)
    }
    
       


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let indexRow = indexPath.row
        let city = cities[indexRow]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! MyCell
        /*
        cell.backgroundColor = UIColor.systemPink
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemTeal
        cell.selectedBackgroundView = backgroundView
         */
        cell.cityName.text = city["City"] as? String
        cell.countryName.text = city["Country"] as? String
        cell.continent.text = city["Continent"] as? String
        if let imageName = city["Image"] as? String{
            cell.cityImageView.image = UIImage(named:imageName)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                     commit editingStyle: UITableViewCell.EditingStyle,
                     forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            let deleteRow = indexPath.row
            cities.remove(at: deleteRow)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
       
        
        
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        /*
        let selectedIndex = indexPath.row
        let city = cities[selectedIndex]
        performSegue(withIdentifier: "goDetail", sender: city)
 */
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let deletAction = UIContextualAction(style: .normal, title: "刪除") { (action, sourceView, completionHandler) in
            let deleteRow = indexPath.row
            self.cities.remove(at: deleteRow)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            //更新Documents內的citylist.plist
            let citiesArray = self.cities as NSArray
            citiesArray.write(to: self.targetURL, atomically: true)
            print("delete")
            completionHandler(true)
        }
        
        
        
        deletAction.backgroundColor = UIColor.systemRed
        
        let insertAction = UIContextualAction(style: .normal, title: "新增") { (action:UIContextualAction, sourceView:UIView, completionHandler: (Bool) -> Void) in
            print("insertAction")
            completionHandler(true)
        }
        
        insertAction.backgroundColor = UIColor.systemGreen
        
        let config = UISwipeActionsConfiguration(actions: [deletAction,insertAction])
        return config
        
    }
    
}

