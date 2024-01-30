//
//  ViewController.swift
//  2lesson14_1
//
//  Created by 徐國堂 on 2024/1/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "WebView"
        navigationItem.rightBarButtonItem = UIBarButtonItem(primaryAction: UIAction(title: "static", handler: { _ in
            let webViewController = WebViewController(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(webViewController, animated: true)
        }))
    }


}

