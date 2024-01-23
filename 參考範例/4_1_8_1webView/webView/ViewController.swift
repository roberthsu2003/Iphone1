//
//  ViewController.swift
//  webView
//
//  Created by 徐國堂 on 2024/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func doButton(_ sender:UIBarButtonItem){
        //由於UIViewController是放在這個storeboard內的,可以直接取得實體
        let wvc = self.storyboard!.instantiateViewController(withIdentifier: "wvc")
        self.navigationController!.pushViewController(wvc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Web View"
        //ViewController可以讓內容延伸到安全區域外
        //UIView內,也可以透過SafeAreaLayoutGuide和SafeAreaInsets來設定
        //預設是all
        //空陣列是全部不可以延伸
        print(self.edgesForExtendedLayout)
        self.edgesForExtendedLayout = []
        
    }


}

