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
        checkFavorite()
    }
    
    var currentFavorite = "manny" {
        didSet{
            print("您現在選擇的是:\(currentFavorite)")
            checkFavorite()
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
    
    func checkFavorite(){
        for listContentView in stackView.arrangedSubviews as! [UIListContentView]{
            if let checkImage = listContentView.viewWithTag(100){
                checkImage.removeFromSuperview()
            }
            if let config = listContentView.configuration as? UIListContentConfiguration{
                if let which = config.text,which == self.currentFavorite{
                    let checkImage = UIImageView(image: UIImage.init(systemName: "checkmark"))
                    checkImage.translatesAutoresizingMaskIntoConstraints = false;
                    checkImage.tag = 100
                    listContentView.addSubview(checkImage)
                    if let textLayouGuide = listContentView.textLayoutGuide{
                        checkImage.leadingAnchor.constraint(equalTo: textLayouGuide.trailingAnchor, constant: 20).isActive = true
                        checkImage.centerYAnchor.constraint(equalTo: textLayouGuide.centerYAnchor).isActive = true
                    }
                }
                
            }
        }
    }

    
}
