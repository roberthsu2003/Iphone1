//
//  ViewController.swift
//  webView
//
//  Created by 徐國堂 on 2024/1/29.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "WebView"
        navigationItem.rightBarButtonItem = UIBarButtonItem(primaryAction: UIAction(title: "static", handler: { _ in
            let webViewController = WebViewController()
            self.navigationController?.pushViewController(webViewController, animated: true)
    
        }))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false //先重新顯示
        self.navigationController?.hidesBarsOnSwipe = false //再重設不會消失
    }
    
    
    
    
    


}

