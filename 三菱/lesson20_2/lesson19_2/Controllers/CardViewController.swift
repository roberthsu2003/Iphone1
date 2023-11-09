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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var panelView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Card"
        navigationController?.navigationBar.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .close, primaryAction: UIAction(handler: { _ in
            self.dismiss(animated: true)
        }))
        
        view.addSubview(panelView)
        NSLayoutConstraint.activate([
            panelView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            panelView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            panelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            panelView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4)
        ])
    }
    
    
    
}
