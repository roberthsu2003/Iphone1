//
//  RootViewController.swift
//  手動建立UIView_UIButton
//
//  Created by 徐國堂 on 2023/9/16.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        title = "自訂View和UIButton"
              
        navigationItem.largeTitleDisplayMode = .always //可以使用.automatic,.always //查詢說明largeTitleDisplayMode
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let cartButton = UIBarButtonItem(
            title: "Cart",
            image: UIImage(systemName: "cart"),
            primaryAction:UIAction{ _ in
                let navi = UINavigationController(
                    rootViewController:CardViewController()
                )
                //只有在這設定才成功
                //navi.modalPresentationStyle = .fullScreen
                navi.modalPresentationStyle = .formSheet
                self.present(navi, animated: true)
            }
        )
        
        navigationItem.rightBarButtonItem = cartButton
    }
    

}
