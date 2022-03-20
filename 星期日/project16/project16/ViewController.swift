//
//  ViewController.swift
//  project16
//
//  Created by 徐國堂 on 2022/3/20.
//

import UIKit

struct Region:Codable{
    let areas:[String]
}

class ViewController: UIViewController {
    @IBOutlet var regionTableView:UITableView!
    
    let areaHttpString = "https://flask-robert.herokuapp.com/youbike/"
    var areas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: areaHttpString) else{
            return
        }
        
        let urlRequest = URLRequest(url: url)
               
        let downloadTask = URLSession.shared.downloadTask(with: urlRequest) { (saveURL:URL?, response:URLResponse?, error:Error?) in
            guard let saveURL = saveURL, let response = response, error == nil else{
                print("下載失敗")
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else {
                 print("網站有異常")
                 return
            }
            
            guard let data = try? Data(contentsOf: saveURL) else{
                print("下載資料Data有誤")
                return
            }
           
            DispatchQueue.main.async {
                /*
                guard let downloadString = String(data: data, encoding: .utf8) else{
                    print("轉換資料有錯")
                    return
                }
                print(downloadString)
                 */
                let jsonDecoder = JSONDecoder()
                guard let region = try? jsonDecoder.decode(Region.self, from: data) else{
                    print("jsonDecoder無法轉換")
                    return
                }
                
                self.areas = region.areas
                print(self.areas)
                self.regionTableView.reloadData()
            }
            
        }
        downloadTask.resume()
        
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return areas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let areaString = areas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        var content = cell.defaultContentConfiguration();
        content.text = areaString
        cell.contentConfiguration = content
        return cell
    }
}

