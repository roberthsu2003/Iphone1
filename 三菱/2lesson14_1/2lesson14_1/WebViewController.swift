//
//  WebViewController.swift
//  2lesson14_1
//
//  Created by 徐國堂 on 2024/1/30.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView:WKWebView!
    
    override func loadView() {
        super.loadView()
        let config = WKWebViewConfiguration()
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        config.defaultWebpagePreferences = preferences
        self.view = WKWebView(frame: .zero, configuration: config)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView = self.view as? WKWebView
        //取得inance-html/index.html的URL
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "inance-html"){
            //載入網頁
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }


}
