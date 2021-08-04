//
//  WebViewController.swift
//  lesson23_FMDB
//
//  Created by 徐國堂 on 2021/8/4.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webView:WKWebView!
    var url:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let encodingUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            if let webUrl = URL(string: encodingUrl){
                let request = URLRequest(url: webUrl)
                webView.load(request)
            }
        }
        
        
        
        
        
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
