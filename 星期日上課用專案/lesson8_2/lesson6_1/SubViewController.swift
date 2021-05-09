//
//  SubViewController.swift
//  lesson8_2
//
//  Created by 徐國堂 on 2021/5/9.
//

import UIKit
import WebKit

class SubViewController: UIViewController {
    @IBOutlet var webView:WKWebView!;
    var city:[String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlPath = city["url"] as! String
        let encodePath=urlPath.addingPercentEncoding(withAllowedCharacters:
                                        .urlQueryAllowed)
        
        guard let url = URL(string: encodePath!) else{
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
