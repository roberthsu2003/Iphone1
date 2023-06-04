//
//  ViewController.swift
//  lesson15_3
//
//  Created by 徐國堂 on 2023/6/4.
//

import UIKit

struct Site:Codable{
    let act:String
    let ar:String
    let bemp:Int
    let lat:Double
    let lng:Double
    let mday:String
    let sarea:String
    let sbi:Int
    let sna:String
}

class ViewController: UITableViewController {
    @IBOutlet var indicator:UIActivityIndicatorView!
    var url = "https://youbike-json.onrender.com/youbike"
    var urlSession = URLSession.shared
    var areas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //下載資料
        let siteURL = URL(string: url)!
        let downloadTask = urlSession.downloadTask(with: siteURL) { (saveURL:URL?, response:URLResponse?, error:Error?) in
            guard let saveURL = saveURL, let response = response, error == nil else{
                print("下載失敗")
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else{
                print("狀態不是200")
                return
            }
            print(saveURL)
            guard let data = try? Data(contentsOf: saveURL) else{
                print("下載完的資料沒有辦法轉出")
                return
            }
            print(data)
            let jsonDecoder = JSONDecoder()
              
            guard let sites = try? jsonDecoder.decode([Site].self, from: data) else{
                print("jsonDecoder無法轉換")
                return
            }
            var tempArea = Set<String>()
            for site in sites{
                tempArea.insert(site.sarea)
            }
            self.areas = Array(tempArea)
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.tableView.reloadData()
                self.tableView.tableHeaderView = nil
                print(self.areas)
            }
           
        }
        downloadTask.resume()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goDetail"){
            let detailViewController = segue.destination as! DetailTableViewController
            detailViewController.area = sender as? String
        }
    }
}



extension ViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
       
        let index = indexPath.row
       cell.textLabel!.text = areas[index]
           
       return cell
    }
    
}

extension ViewController{
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        let area = areas[indexPath.row]
        performSegue(withIdentifier: "goDetail", sender: area)
        
    }
}



