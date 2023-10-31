//
//  CardViewController.swift
//  手動建立UIView_UIButton
//
//  Created by 徐國堂 on 2023/9/16.
//

import UIKit

class CardViewController: UIViewController {
    private lazy var panelView:CartPanelView = {
        let view = CartPanelView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 10
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .tertiarySystemBackground
        title = "Cart"
        //下面設定不會成功
        //navigationController?.modalPresentationStyle = .fullScreen
        //isModalInPresentation = true
        //modalPresentationStyle = .currentContext
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .systemGroupedBackground
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            systemItem: .close,
            primaryAction: UIAction{ _ in
                self.dismiss(animated: true)
            })
        
        view.addSubview(panelView)
        NSLayoutConstraint.activate([
            panelView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            panelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            panelView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            panelView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4)
        ])
    }
    

}
