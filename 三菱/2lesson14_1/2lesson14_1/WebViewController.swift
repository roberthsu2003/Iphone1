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
        self.view = WKWebView(frame: .zero, configuration: config)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView = self.view as? WKWebView
    }


}
