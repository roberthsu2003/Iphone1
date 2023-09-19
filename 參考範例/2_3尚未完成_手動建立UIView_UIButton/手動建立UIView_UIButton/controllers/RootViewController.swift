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
        
        navigationItem.largeTitleDisplayMode = .never //可以使用.automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let cartButton = UIBarButtonItem(
            title: "Cart",
            image: UIImage(systemName: "cart"),
            primaryAction:UIAction{ _ in
                self.present(
                    UINavigationController(
                        rootViewController:CardViewController()
                    )
                    , animated: true)
            }
        )
        
        navigationItem.rightBarButtonItem = cartButton
    }
    

}
