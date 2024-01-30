//
//  WebViewController.swift
//  webView
//
//  Created by 徐國堂 on 2024/1/29.
//

import UIKit
import WebKit
import SafariServices

class WebViewController: UIViewController {
    var activityIndicator = UIActivityIndicatorView()
    var obs = Set<NSKeyValueObservation>()
    
    override func loadView() {
        super.loadView()
        let config = WKWebViewConfiguration()
        //和回應html內的javascript
        /*
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        config.defaultWebpagePreferences = preferences
         */
        config.userContentController = WKUserContentController()
        //使用這個方法才可以使用WKUserContentController
        //這個不行 config.userContentController.add(self, contentWorld: .defaultClient ,name: "contact")
        config.userContentController.add(self, name: "toApp") //使用代理人機制
        self.view = WKWebView(frame: .zero, configuration: config)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = self.view as! WKWebView
        webView.navigationDelegate = self
        
        self.activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        activityIndicator.color = .white
        webView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: webView.centerYAnchor)
        ])
        
        //webView使用KVO,載入網頁之前就要建立KVO
        let kvo = webView.observe(\.isLoading, options: .new) { [unowned  self](webView:WKWebView, ch:NSKeyValueObservedChange<Bool>) in
            if let val = ch.newValue{
                if val{
                    print("開始動畫")
                    self.activityIndicator.startAnimating()
                }else{
                    print("停止動畫")
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        obs.insert(kvo)
        //載入網頁
        if let fileURL = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "inance-html"){
            webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
        }
        
        //加入手勢
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipe.direction = .right
        webView.scrollView.addGestureRecognizer(swipe)
        
    
    }
    
    @objc func swiped(_ sender:UISwipeGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let webView = self.view as! WKWebView
        self.navigationController?.isToolbarHidden = false
        self.setToolbarItems([
            UIBarButtonItem(primaryAction: UIAction(title: "home", handler: { _ in
                //呼叫html內的javascript
                webView.evaluateJavaScript("goHome();") { (result:Any?, error:Error?) in
                    guard let result = result as? String, error == nil else{
                        print("錯誤")
                        print(error!)
                        return
                    }
                    self.title = result
                }
            })),
            UIBarButtonItem(primaryAction: UIAction(title: "contact", handler: { _ in
                webView.evaluateJavaScript("goContact();") { (result:Any?, error:Error?) in
                    guard let result = result as? String, error == nil else{
                        print("錯誤")
                        return
                    }
                    self.title = result
                }
            })),
            UIBarButtonItem(primaryAction: UIAction(title: "service", handler: { _ in
                webView.evaluateJavaScript("goService();") { (result:Any?, error:Error?) in
                    guard let result = result as? String, error == nil else{
                        print("錯誤")
                        return
                    }
                    self.title = result
                }
            })),
            UIBarButtonItem(primaryAction: UIAction(title: "about", handler: { _ in
                webView.evaluateJavaScript("goAbout();") { (result:Any?, error:Error?) in
                    guard let result = result as? String, error == nil else{
                        print("錯誤")
                        return
                    }
                    self.title = result
                }
            }))
            
        ], animated: true)
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationItem.title = "Home"
    }
    

}

extension WebViewController:WKScriptMessageHandler{
    func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ){
        print("userContentController")
        if message.name == "toApp"{
            if let body = message.body as? String{
                if body == "contact"{
                    //自動開啟手機的phone call
                    let alertController = UIAlertController(title: "聯絡方式", message: "AM:9:00 to PM:6:00", preferredStyle: .alert)
                    let taipei = UIAlertAction(title: "台北公司", style: .default) { _ in
                        if let phoneCallURL = URL(string: "tel://0976876923"){
                            let application = UIApplication.shared
                            if (application.canOpenURL(phoneCallURL)){
                                application.open(phoneCallURL)
                            }
                        }else{
                            print("不可以聯絡")
                        }
                        
                    }
                    
                    let taichan = UIAlertAction(title: "台中公司", style: .default) { _ in
                        print("台中公司")
                    }
                    
                    alertController.addAction(taipei)
                    alertController.addAction(taichan)
                    present(alertController, animated: true)
                    
                }
            }
        }
    }
}

extension WebViewController:WKNavigationDelegate{
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        preferences: WKWebpagePreferences,
        decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void
    ){
       //decisionHandler是給我們一個method,而不是要我們實作這個method
      //一定要執行,決定看允許連結嗎?
        if navigationAction.navigationType == .linkActivated{ //查看是否是連結
            if let url = navigationAction.request.url{ //取得連結網址
                //取得連結最後的文字
                if url.lastPathComponent == "goBack"{
                    self.navigationController?.popViewController(animated: true)
                    decisionHandler(.cancel,preferences)
                    return
                }
            }
            
            if let url = navigationAction.request.url{ //取得連結網址
                //取得連結最後的文字
                
                if url.absoluteString == "http://tidbits.com/article/11682"{
                    let svc = SFSafariViewController(url: url)
                    svc.delegate = self
                    self.present(svc, animated: true)
                    decisionHandler(.cancel,preferences)
                    return
                }
            }
        }
        decisionHandler(.allow, preferences)
    }
}

extension WebViewController:SFSafariViewControllerDelegate{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController){
        print("safariViewController結束")
    }
}
