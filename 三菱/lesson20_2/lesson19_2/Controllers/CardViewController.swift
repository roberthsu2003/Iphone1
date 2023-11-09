//
//  CardViewController.swift
//  lesson20_2
//
//  Created by 徐國堂 on 2023/11/9.
//

import UIKit

class CardViewController: UIViewController {

    init(){
        super.init(nibName: nil, bundle: nil)
        //view.backgroundColor = .systemBackground
        view.backgroundColor = .brown
        navigationItem.title = "Card"
        navigationController?.navigationBar.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
}
