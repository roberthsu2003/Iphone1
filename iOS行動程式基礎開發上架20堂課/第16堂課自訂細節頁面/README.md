# 自訂細節頁面
1. 建立City class,將Citys陣列改為儲存City
2. 建立功能更完善的DetailViewController
3. 自訂TableView外觀
4. 自訂NavigationBar 的外觀

## 1.建立City class,將Citys陣列改為儲存City

```swift
import Foundation
class City{
    var city:String!
    var continent:String!;
    var country:String!;
    var image:String!;
    var local:String!;
    var latitude:Double!;
    var longitude:Double!;
    var url:String!;
    
    init(city:String, continent:String, country:String, image:String, local:String, lat latitude:Double, lon longitude:Double,url:String){
        self.city = city;
        self.continent = continent;
        self.country = country;
        self.image = image;
        self.local = local;
        self.latitude = latitude
        self.longitude = longitude;
        self.url = url;
    }
    
    convenience init(){
        self.init(city: "", continent: "", country: "", image: "", local: "", lat: 0.0, lon: 0.0, url:"");
    }
}

```

ViewController

```swift

import UIKit

class ViewController: UIViewController{
    @IBOutlet var cityTableView:UITableView!
    //要依據plist的架構來設定cities的資料類型
    //如果使用type!,代表暫時是nil,第一下就有值
    var cities = [City]()
    var cityIsMarked:[Bool]!
    
   
    
    override func loadView() {
        super.loadView();
        let bundle = Bundle.main
        guard let pathUrl = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("程式出錯了")
            return
        }
        if let dicCitys = NSArray(contentsOf: pathUrl) as? [[String:Any]]{
            for dicCity in dicCitys{
                let city = dicCity["City"] as? String;
                let country = dicCity["Country"] as? String;
                let continent = dicCity["Continent"] as? String;
                let image = dicCity["Image"] as? String;
                let local = dicCity["Local"] as? String;
                let url = dicCity["url"] as? String;
                let latitude = dicCity["lat"] as? Double;
                let longitude = dicCity["long"] as? Double;
                let oneCity = City(city: city, continent: continent, country: country, image: image, local: local, lat: latitude, lon: longitude, url: url)
                cities.append(oneCity)
            }
        }
       
        cityIsMarked = Array(repeating: false, count: cities.count)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.dataSource = self
        cityTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.hidesBarsOnSwipe = true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("執行prepare for segue")
        if segue.identifier == "goDetail"{
            if let indexPath = cityTableView.indexPathForSelectedRow{
                print("selected row:\(indexPath.row)")
                let city = cities[indexPath.row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.city = city
                
            }
            
        }
    }
    
    
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row
        let city = cities[rowIndex]
        var cell:CityCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "MYCELL", for: indexPath) as? CityCell
       
        //image
        let imageName = city.image
        cell.cityImageView.image = UIImage(named: imageName ?? "")
        cell.cityImageView.layer.cornerRadius = 40.0
        //cell.cityImageView.layer.masksToBounds = true;
        
        //cityname
        
        cell.cityLabel.text = city.city
        cell.countryLabel.text = city.country
        cell.continentLabel.text = city.continent
        if cityIsMarked[rowIndex]{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView,
                     commit editingStyle: UITableViewCell.EditingStyle,
                     forRowAt indexPath: IndexPath){
        //刪除tableView的row
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            cityIsMarked.remove(at: indexPath.row)
            print("現在剩下的資料還有\(cities.count)")
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "goDetail", sender: self)
        
    }
 
    
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let shareAction = UIContextualAction(style: .normal, title: "分享") { (action:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
            print("分享")
            completionHandler(true)
        }
        
        let deleteAction = UIContextualAction(style: .normal, title: "刪除") { (atcion:UIContextualAction, view:UIView, completionHandler:(Bool) -> Void) in
            
            self.cities.remove(at: indexPath.row)
            self.cityIsMarked.remove(at: indexPath.row)
            print("現在剩下的資料還有\(self.cities.count)")
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
            
        }
        
        shareAction.backgroundColor = UIColor(red: 48.0/255, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return UISwipeActionsConfiguration(actions: [shareAction,deleteAction])
    }
    
    
}



```

CityCell

```swift
import UIKit

class CityCell: UITableViewCell {
    @IBOutlet var cityLabel:UILabel!;
    @IBOutlet var countryLabel:UILabel!;
    @IBOutlet var continentLabel:UILabel!;
    @IBOutlet var cityImageView:UIImageView!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

```

## 建立功能更完善的DetailViewController

![](images/pic1.png)

DetailViewCell

```swift
//
//  DetailViewCell.swift
//  Detail
//
//  Created by Robert on 2019/2/8.
//  Copyright © 2019 gjun. All rights reserved.
//

import UIKit

class DetailViewCell: UITableViewCell {
    @IBOutlet var fieldLabel:UILabel!;
    @IBOutlet var valueLabel:UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

```

```swift
//
//  CityDetailViewController.swift
//  Navigation
//
//  Created by Robert on 2019/2/6.
//  Copyright © 2019 gjun. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var cityImageView:UIImageView!;
    @IBOutlet var tableView:UITableView!;
    //var cityImageName:String?;
    //var cityName:String?;
    var city:City?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityImageView.image = UIImage(named: city?.image ?? "");
        title = city?.city;
        
        //change table appearance
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2);
        tableView.tableFooterView = UIView(frame: CGRect.zero);
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.6);
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.hidesBarsOnSwipe = false;
        navigationController?.setNavigationBarHidden(false, animated: true);
    }
    

    
}
extension CityDetailViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! DetailViewCell;
        cell.backgroundColor = UIColor.clear;
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text = "城市"
            cell.valueLabel.text = city?.city;
        case 1:
            cell.fieldLabel.text = "國家"
            cell.valueLabel.text = city?.country;
        case 2:
            cell.fieldLabel.text = "洲"
            cell.valueLabel.text = city?.continent;
        case 3:
            cell.fieldLabel.text = "網址"
            cell.valueLabel.text = city?.url;
        default:
            cell.fieldLabel.text = "";
            cell.valueLabel.text = "";
            
        }
        return cell;
    }
}

```