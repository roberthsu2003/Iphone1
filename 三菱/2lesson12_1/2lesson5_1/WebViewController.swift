//
//  WebViewController.swift
//  2lesson12_1
//
//  Created by 徐國堂 on 2024/1/23.
//

import UIKit

class WebViewController: UIViewController {
    var web_url:String
    
    init(web_url:String){
        self.web_url = web_url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(web_url)

    }

}
