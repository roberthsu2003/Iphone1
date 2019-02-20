//
//  WebViewController.swift
//  DataSource
//
//  Created by Robert on 2019/2/20.
//  Copyright © 2019 gjun. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webView:WKWebView!;
    var url:String!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(url);
        let cityUrlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed);
        
        if let cityURL = URL(string:cityUrlString!){
            let cityRequest = URLRequest(url: cityURL);
            webView.load(cityRequest);
        }else{
            print("error");
        }

    }
    

   

}
