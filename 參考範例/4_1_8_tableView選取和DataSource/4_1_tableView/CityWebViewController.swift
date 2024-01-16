//
//  CityWebViewController.swift
//  4_1_tableView
//
//  Created by 徐國堂 on 2024/1/16.
//

import UIKit
import WebKit

class CityWebViewController: UIViewController {
    var web_url:String?
    var activiate:UIActivityIndicatorView!
    var obs = Set<NSKeyValueObservation>()
    
    init(web_url: String) {
        self.web_url = web_url
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view = WKWebView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = self.view as! WKWebView
        let url = URL(string: web_url!)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //indicatorView
        let act = UIActivityIndicatorView(style: .large)
        act.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        act.color = .black
        webView.addSubview(act)
        act.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            act.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
            act.centerYAnchor.constraint(equalTo: webView.centerYAnchor)
        ])
        
        self.activiate = act
        
        //webkit user KVO
        let ob = webView.observe(\.isLoading, options: .new) { [unowned self](wv, ch) in
            if let val = ch.newValue{
                if val{
                    print("動")
                    self.activiate.startAnimating()
                }else{
                    print("停")
                    self.activiate.stopAnimating()
                }
            }
        }
        self.obs.insert(ob)
        
    }
}
