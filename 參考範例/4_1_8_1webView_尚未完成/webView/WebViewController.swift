//
//  WebViewController.swift
//  webView
//
//  Created by 徐國堂 on 2024/1/21.
//

import UIKit
import WebKit

class MyMessageHandler:NSObject, WKScriptMessageHandler{
    weak var delegate: WKScriptMessageHandler?
    init(delegate:WKScriptMessageHandler){
        self.delegate = delegate
        super.init()
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        self.delegate?.userContentController(userContentController, didReceive: message)
        print("playbutton")
    }
    
    deinit{
        print("message handler dealloc")
    }
}

final class WebViewController: UIViewController {
    @IBOutlet weak var wv:WKWebView!
    var activity = UIActivityIndicatorView()
    var obs = Set<NSKeyValueObservation>()
    var fontsize = 18
    var oldHTMLString:String?
    
    var cssrule:String{
        return """
        var s = document.createElement('style');
        s.textContent = 'body { font-size: \(self.fontsize)px; }';
        document.documentElement.appendChild(s);
        """
    }
    
    var cssrule2:String{
        return """
        var s = document.createElement('style');
        s.textContent = `body { font-size: ${thefontsize}px; }`;
        document.documentElement.appendChild(s);
        """
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.edgesForExtendedLayout = []
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var leak:Bool{return false}
        switch leak{
        case true:
            //要自已建立WKWebViewConfiguration()才可以,不可以使用取出來的,不然不會出現
            //let config = self.wv.configuration
            //config.userContentController.add(self, contentWorld: .defaultClient, name: "playbutton")
            
            let configuration = WKWebViewConfiguration()
            configuration.userContentController = WKUserContentController()
            configuration.userContentController.add(self, name: "playbutton")
            let webView = WKWebView(frame: self.view.bounds, configuration: configuration)
            self.view.addSubview(webView)
            self.wv = webView
        case false:
            let handler = MyMessageHandler(delegate: self)
            let configuration = WKWebViewConfiguration()
            configuration.userContentController = WKUserContentController()
            configuration.userContentController.add(handler, name: "playbutton")
            let webView = WKWebView(frame: self.view.bounds, configuration: configuration)
            self.view.addSubview(webView)
            self.wv = webView
        }
        //可以看到捲動後超過的背景色
        wv.scrollView.backgroundColor = .black
        
        //進度畫面
        let act = UIActivityIndicatorView(style: .large)
        act.backgroundColor = UIColor(white: 0.1, alpha: 0.1)
        act.color = .white
        self.activity = act
        wv.addSubview(act)
        act.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            act.centerXAnchor.constraint(equalTo: wv.centerXAnchor),
            act.centerYAnchor.constraint(equalTo: wv.centerYAnchor)
        ])
        
        //webkit 使用 KVO
        obs.insert(wv.observe(\.isLoading, options: .new, changeHandler: { [unowned self](wv:WKWebView, ch:NSKeyValueObservedChange<Bool>) in
            if let val = ch.newValue{
                if val{
                    print("開始載入")
                    self.activity.startAnimating()
                }else{
                    self.activity.stopAnimating()
                }
                
                
            }}))
        
        obs.insert(wv.observe(\.title, changeHandler: { (wv:WKWebView, change:NSKeyValueObservedChange<String?>) in
            if let val = change.newValue, let title = val{
                print(title)
            }
        }))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear, req:\(self.wv.url as Any)")
        print("wv scroll view delegate", self.wv.scrollView.delegate as Any)
        
        var which:Int {return 1}
        switch which{
        case 1:
            let b = UIBarButtonItem(title: "Size", style: .plain, target: self, action: #selector(doDecreaseSize))
            self.navigationItem.rightBarButtonItems = [b]
            //加入css規則
            do{
                let rule = self.cssrule
                let script = WKUserScript(source: rule, injectionTime: .atDocumentStart, forMainFrameOnly: true, in: .defaultClient)
                let config = self.wv.configuration
                config.userContentController.addUserScript(script)
            }
            
            if let oldHTMLString = self.oldHTMLString{
                //如果有舊的html
                print("restoring html")
                let templatepath = Bundle.main.path(forResource: "htmlTemplate", ofType: "html")!
                let oldBase = URL(fileURLWithPath: templatepath)
                
                self.wv.loadHTMLString(oldHTMLString, baseURL: oldBase)
                return
            }
            //載入html的內容
            let bodypath = Bundle.main.path(forResource: "htmlbody", ofType: "txt")!
            let ss = try! String(contentsOfFile: bodypath)
            
            let templatePath = Bundle.main.path(forResource: "htmlTemplate", ofType: "html")!
            let base = URL(fileURLWithPath: templatePath)
            var s = try! String(contentsOfFile: templatePath)
            
            s = s.replacingOccurrences(of: "<maximagewidth>", with: "80%")
            s = s.replacingOccurrences(of: "<margin>", with: "10")
            s = s.replacingOccurrences(of:"<guid>", with:"http://tidbits.com/article/12228")
            s = s.replacingOccurrences(of:"<ourtitle>", with:"Lion Details Revealed with Shipping Date and Price")
            // note way to set up messaging from web page's javascript to us
            s = s.replacingOccurrences(of:"<playbutton>", with:#"<img src="listen.png" onclick="window.webkit.messageHandlers.playbutton.postMessage('play')">"#)
            s = s.replacingOccurrences(of:"<author>", with:"TidBITS Staff")
            s = s.replacingOccurrences(of:"<date>", with:"Mon, 06 Jun 2011 13:00:39 PDT")
            s = s.replacingOccurrences(of:"<content>", with:ss)
            print(s)
            //print("======")
            //print(base)
            self.wv.loadHTMLString(s, baseURL: base)
            self.oldHTMLString = s
            
            
            
        default:
            break
        }
        
    }
    
    @objc func doDecreaseSize(_ sender:UIBarButtonItem){
        print("減小文字大小")
        self.fontsize -= 1
        if self.fontsize < 10{
            self.fontsize = 20
        }
        /*
         可以這樣加入javascript,也可以向下加入javascript
        let s = self.cssrule
        self.wv.evaluateJavaScript(s, in: nil, in: .defaultClient)
         */
        self.wv.callAsyncJavaScript(self.cssrule2, arguments: ["thefontsize":self.fontsize], in: nil, in: .defaultClient)
    }
    

}

extension WebViewController:WKScriptMessageHandler{
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("Hello! playbutton")
    }
    
    
}
