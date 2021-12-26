//
//  ViewController.swift
//  project3
//
//  Created by 徐國堂 on 2021/12/26.
//

import UIKit

class ViewController: UIViewController {

    //實體method,這個method不是由我們來呼叫,而是ios自動呼叫,當storyboard的內容已經可以用程式控制時
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad執行了")
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        print("view內的按鈕畫面將顯示了")
    }

    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        print("view內的按鈕畫已顯示了")
    }

}

