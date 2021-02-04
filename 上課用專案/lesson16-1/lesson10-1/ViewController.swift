
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("執行prepare for segue")
        if segue.identifier == "goDetail"{
            if let indexPath = cityTableView.indexPathForSelectedRow{
                print("selected row:\(indexPath.row)")
                let city = cities[indexPath.row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.cityName = city.city
                detailViewController.cityImageName = city.image
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

