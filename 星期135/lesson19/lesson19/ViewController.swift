//
//  ViewController.swift
//  lesson19
//
//  Created by 徐國堂 on 2022/8/8.
//

import UIKit
struct Region:Codable{
    let areas:[String]
}

class ViewController: UITableViewController {
    var areas = [String]()
    let httpString = "https://flask-robert.herokuapp.com/youbike/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        download_areas(urlString: httpString)
    }
    
    func download_areas(urlString:String){
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("areas.plist")
        print(documentUrl.path)
        if !FileManager.default.fileExists(atPath: documentUrl.path){
            guard let url = URL(string: httpString) else{
                return
            }
            let downloadTask = URLSession.shared.downloadTask(with: url){
                (saveURL:URL?, response:URLResponse?, error:Error?) in
                guard let saveURL=saveURL,let response=response, error == nil else{
                    print("下載失敗")
                    return
                }
                
                guard (response as! HTTPURLResponse).statusCode == 200 else{
                    print("下載狀態不是200")
                    return
                }
                
                guard let data = try? Data(contentsOf: saveURL) else{
                    print("下載的資料無法轉成Data")
                    return
                }
                /*
                guard let jsonString = String(data: data, encoding: .utf8) else{
                    print("資料轉成字串出錯了")
                    return
                }
                 */
                
                DispatchQueue.main.async {
                    print("下載成功")
                    let jsonDecoder = JSONDecoder()
                    guard let region = try? jsonDecoder.decode(Region.self, from: data) else{
                        print("jsondecoder錯誤")
                        return
                    }
                    
                    print("資料來源下載檔案\(region.areas)")
                    self.areas = region.areas
                    self.tableView.reloadData()
                    //儲存為plist
                    let areas_nsarray = region.areas as NSArray
                    if (try? areas_nsarray.write(to: documentUrl)) == nil{
                        print("存檔失敗")
                    }else{
                        print("存檔成功")
                    }
                }
                
            }
            downloadTask.resume()
        }
        else{
            if let areas = (try? NSArray(contentsOf: documentUrl, error: ())) as? [String]{
                self.areas = areas
                print("資料來源為plist\(self.areas)")
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail"{
            let area = sender as! String
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.area = area
            detailViewController.passBack = {
                (site:YoubikeData.Site) -> Void in
                print(site.sna)
                self.title = site.sna
            }
        }
    }


}

extension ViewController{
    //UITableViewDataSource
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return areas.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let area = areas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        if #available(iOS 15, *){
            var content = cell.defaultContentConfiguration()
            content.text = area;
            cell.contentConfiguration = content
        }else{
            cell.textLabel?.text = area
            
        }
        
        return cell
    }
}

extension ViewController{
    //UITableViewDelegate
    override func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        let area = areas[indexPath.row]
        performSegue(withIdentifier: "goDetail", sender: area)
    }
    
}

