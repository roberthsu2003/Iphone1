//
//  DetailViewController.swift
//  lesson19
//
//  Created by 徐國堂 on 2022/8/8.
//

import UIKit

class DetailViewController: UITableViewController {
    var area:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = area;
        var urlComponets = URLComponents()
        urlComponets.scheme = "https"
        urlComponets.host = "flask-robert.herokuapp.com"
        urlComponets.path = "/youbike/" + area
        guard let url = urlComponets.url else{
            print("url編碼錯誤")
            return
        }
        print(url.absoluteString)
        
    }

   

}
