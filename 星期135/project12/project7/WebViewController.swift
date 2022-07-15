//
//  WebViewController.swift
//  project12
//
//  Created by 徐國堂 on 2022/7/15.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var city:City!
    @IBOutlet var webView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        let appStoreURL = city.url
        if let urlString = appStoreURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),let url = URL(string: urlString){
                let request = URLRequest(url: url)
                webView.load(request)
        }

        
        
    }
    

   
}

extension WebViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!){
        print("開始載入")
    }
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!){
        print("載入完成")
    }
}
