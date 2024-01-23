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
    var obs = Set<NSKeyValueObservation>()
    lazy var activityIndicatoerView:UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(style: .large)
        act.backgroundColor = .blue.withAlphaComponent(0.2)
        act.color = .white
        act.hidesWhenStopped = true
        return act
    }()
    
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
        webView.addSubview(activityIndicatoerView)
        activityIndicatoerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatoerView.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
            activityIndicatoerView.centerYAnchor.constraint(equalTo: webView.centerYAnchor)
        ])
        
        //加入KVO
        let ob = webView.observe(\.isLoading, options: .new) { [unowned self](webView:WKWebView, ch:NSKeyValueObservedChange<Bool> )in
            if let val = ch.newValue{
                if val{
                    print("正在載入")
                    activityIndicatoerView.startAnimating()
                }else{
                    print("載入完成")
                    activityIndicatoerView.stopAnimating()
                }
            }
        }
        obs.insert(ob)
        
        //webView.navigationDelegate = self
        guard let url = URL(string: web_url) else{
            print("網址無法解析")
            return
        }
        let request = URLRequest(url: url, timeoutInterval: 20)
        webView.load(request)

    }

}
/*
 extension WebViewController:WKNavigationDelegate{
 func webView(
 _ webView: WKWebView,
 didStartProvisionalNavigation navigation: WKNavigation!
 ){
 
 activityIndicatoerView.startAnimating()
 }
 
 func webView(
 _ webView: WKWebView,
 didFinish navigation: WKNavigation!
 ){
 
 activityIndicatoerView.stopAnimating()
 }
 
 
 }
 */
