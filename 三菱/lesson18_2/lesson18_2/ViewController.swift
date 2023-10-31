//
//  ViewController.swift
//  lesson18_2
//
//  Created by 徐國堂 on 2023/10/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickSecond(_ sender:UIButton){
        let secondViewController = SecondViewController(nibName: nil, bundle: nil)
        secondViewController.title = "SecondViewController"
        secondViewController.view.backgroundColor = .systemBackground
        
        let navigationController = UINavigationController(rootViewController: secondViewController)
        
        self.present(navigationController, animated: true)
        
    }


}

