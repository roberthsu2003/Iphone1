//
//  ViewController.swift
//  lesson26
//
//  Created by 徐國堂 on 2021/8/6.
//

import UIKit
struct Region:Codable{
    let areas:[String]
}

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    @IBOutlet var indicator:UIActivityIndicatorView!
    let areasHttpString = "https://flask-robert.herokuapp.com/youbike/"
    var areas = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: areasHttpString)else{
            print("url出問題")
            return
        }
        let downloadTask = URLSession.shared.downloadTask(with: URLRequest(url: url)) { (saveURL:URL?, response:URLResponse?, error:Error?) in
            guard let saveURL = saveURL, let response = response, error == nil else{
               print("下載錯誤")
               return;
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else{
                print("狀態不是200")
                return
            }
            
            guard let data = try? Data(contentsOf: saveURL)else{
                print("下載資料無法轉成Data")
                return
            }
            /*
            let str = String(decoding: data, as: UTF8.self)
            print(str)
             */
            
            
            DispatchQueue.main.async {
                let jsonDecoder = JSONDecoder()
                guard let region = try? jsonDecoder.decode(Region.self, from: data)else{
                    print("jsonDecoder無法轉換資料")
                    return
                }
                self.areas = region.areas
                self.tableView.reloadData()
                self.indicator.stopAnimating()
            }
            
            
            
        }
        
        downloadTask.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail"{
            let areaName = sender as! String
            let detailViewController = segue.destination as! DetailTableViewController
            detailViewController.areaName = areaName
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("tableView顯示了")
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return areas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let areaName = areas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = areaName
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let areaName = areas[indexPath.row]
        performSegue(withIdentifier: "goDetail", sender: areaName)
    }
}

