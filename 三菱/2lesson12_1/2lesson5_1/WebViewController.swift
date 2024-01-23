//
//  WebViewController.swift
//  2lesson12_1
//
//  Created by 徐國堂 on 2024/1/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var web_url:String
    
    init(web_url:String){
        self.web_url = web_url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let webViewConfiguration = WKWebViewConfiguration()
        view = WKWebView(frame: .zero, configuration: webViewConfiguration)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = self.view as! WKWebView
        guard let url = URL(string: web_url) else{
            print("網址無法解析")
            return
        }
        let request = URLRequest(url: url, timeoutInterval: 20)
        webView.load(request)

    }

}
