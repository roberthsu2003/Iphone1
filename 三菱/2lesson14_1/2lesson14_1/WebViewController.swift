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
    var obs = Set<NSKeyValueObservation>()
    var activityIndicator:UIActivityIndicatorView!
    
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
        navigationItem.title = "Home"
        self.webView = self.view as? WKWebView
        self.activityIndicator = UIActivityIndicatorView(style: .large)
        self.activityIndicator.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        self.activityIndicator.color = UIColor.white
        self.webView.addSubview(activityIndicator)
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: webView.centerYAnchor)
        ])
        //KVO
        let kvo = self.webView.observe(\.isLoading, options: .new) { [unowned self](webView:WKWebView, change:NSKeyValueObservedChange<Bool>) in
            if let val = change.newValue{
                if val{
                    print("動畫開始")
                    activityIndicator.startAnimating()
                }else{
                    activityIndicator.stopAnimating()
                    print("動畫結束")
                }
            }
        }
        
        obs.insert(kvo)
        
        
        //取得inance-html/index.html的URL
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "inance-html"){
            //載入網頁
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
        //self.navigationController?.hidesBarsOnTap = true
    }


}
