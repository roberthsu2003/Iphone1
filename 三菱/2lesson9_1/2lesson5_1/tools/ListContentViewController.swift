//
//  ListContentViewController.swift
//  2lesson8_2
//
//  Created by 徐國堂 on 2024/1/9.
//

import UIKit

class ListContentViewController: UIViewController {
    @IBOutlet var stackView:UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ListContent選取"
        for pep in ["manny", "moe", "jack"]{
            var config = UIListContentConfiguration.cell()
            config.text = pep
            config.image = UIImage(named: pep)
            let listContentView = UIListContentView(configuration: config)
            stackView.addArrangedSubview(listContentView)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        stackView.addGestureRecognizer(tapGesture)
        
    }
    
    var currentFavorite = "moe" {
        didSet{
            print("您現在選擇的是:\(currentFavorite)")
        }
    }
    
    @objc func didTap(_ tapGesture:UIGestureRecognizer){
        if tapGesture.state == .ended, let stackView = tapGesture.view {
            let stackViewPoint = tapGesture.location(in: stackView)
            if let listContentView = stackView.hitTest(stackViewPoint, with: nil) as? UIListContentView{
                if let configuration = listContentView.configuration as? UIListContentConfiguration{
                    if let which = configuration.text{
                        self.currentFavorite = which
                    }
                }
            }
        }
    }

    
}
