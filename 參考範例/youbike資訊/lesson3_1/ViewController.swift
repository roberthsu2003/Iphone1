//
//  ViewController.swift
//  lesson3_1
//
//  Created by 徐國堂 on 2021/3/23.
//

import UIKit

struct Region:Codable{
    let areas:[String]
}

class ViewController: UIViewController {
    @IBOutlet var regionTableView:UITableView!
    @IBOutlet var indicator:UIActivityIndicatorView!
    
    let areasHttpString = "https://flask-robert.herokuapp.com/youbike/"
    //var areas:[String]!
    var areas = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView的代理人是誰
        regionTableView.dataSource = self
        regionTableView.delegate = self
        
        
        let url = URL(string: areasHttpString)!
        let downloadTask = URLSession.shared.downloadTask(with: url){
            (saveURL:URL?, response:URLResponse?, error:Error?) in
            guard let saveURL=saveURL, let response = response, error == nil else{
                print("下載失敗")
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else{
                print("狀態不是200")
                return
            }
            
            guard let data = try? Data(contentsOf: saveURL) else{
                print("下載資料無法轉出")
                return
            }
            
            DispatchQueue.main.async {
                let jsonDecoder = JSONDecoder()
                guard let region = try? jsonDecoder.decode(Region.self, from: data) else{
                    print("jsonDecoder無法轉換")
                    return
                }
                
                
                self.areas = region.areas
                self.regionTableView.reloadData()
                self.indicator.stopAnimating()
                print(self.areas)
            }
        }
        downloadTask.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let region = sender as? String
        
        
        if segue.identifier == "goDetail"{
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.regionName = region
        }
    }

}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return areas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel!.text = areas[indexPath.row]
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let selectedRegion = areas[indexPath.row]
        performSegue(withIdentifier: "goDetail", sender: selectedRegion)
    }
}
