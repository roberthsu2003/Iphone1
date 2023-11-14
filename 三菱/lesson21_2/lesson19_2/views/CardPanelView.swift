//
//  CardPanelView.swift
//  lesson21_2
//
//  Created by 徐國堂 on 2023/11/14.
//

import UIKit

class CardPanelView: UIView {
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView(frame: CGRect.zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .brown
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    private lazy var infomationStackView:UIStackView = {
        let stackView = UIStackView(frame: CGRect.zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .brown
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var costLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Cost:$9.41"
        label.textAlignment = .left
        return label
    }()
    
    private lazy var shippingSpeedButton:UIButton = {
        var config = UIButton.Configuration.tinted()
        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        button.menu = UIMenu(children: [
            UIAction(title: "Express Shipping",
                     image: UIImage(systemName: "hare.fill"),
                     handler: { _ in
                         print("Express Shipping選取")
                     }),
            UIAction(title: "Standard Shipping",
                     image: UIImage(systemName: "tortoise.fill"),
                     handler: { _ in
                         print("Standard Shipping選取")
                     }),
            
        ])
        return button
    }()
    
    init(){
        super.init(frame: CGRect.zero)
        backgroundColor = .secondarySystemBackground
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])
        
        stackView.addArrangedSubview(infomationStackView)
        infomationStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        infomationStackView.addArrangedSubview(costLabel)
        infomationStackView.addArrangedSubview(shippingSpeedButton)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
