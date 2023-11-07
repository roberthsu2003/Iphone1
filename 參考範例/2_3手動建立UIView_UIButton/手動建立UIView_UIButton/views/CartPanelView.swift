//
//  CartPanelView.swift
//  手動建立UIView_UIButton
//
//  Created by 徐國堂 on 2023/9/16.
//

import UIKit

class CartPanelView:UIView{
    
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .gray
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var informationStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var costLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Cost:$9.41"
        label.textAlignment = .left
        return label
    }()
    
    private lazy var shippingSpeedButton:UIButton = {
        var config = UIButton.Configuration.tinted()
        config.buttonSize = .medium
        config.cornerStyle = .medium
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outgoing = incoming
            outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
            return outgoing
        })
         
        let button = UIButton(type: .system)
        button.configuration = config
        //可以關閉以下2個,看效果
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Shipping Speed", for: .normal)
        button.menu = UIMenu(children: [
            UIAction(title: "Express Shipping", image: UIImage(systemName: "hare.fill"),handler: { _ in
                print("Express Shipping Selected")
            }),
            UIAction(title: "Standard Shipping", image: UIImage(systemName: "tortoise.fill"), handler: { _ in
                print("standard Shipping Selected")
            })
        ])
        return button
    }()
    
    private lazy var checkoutButton:UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        config.imagePlacement = .leading
        config.imagePadding = 5
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outgoing = incoming
            outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
            return outgoing
        })
        
        let button = UIButton(type: .system)
        button.configuration = config
        button.configurationUpdateHandler = {
            [unowned self] button in
            var config = button.configuration
            config?.showsActivityIndicator = self.checkingOut
            config?.title = self.checkingOut ? "Checking Out..." : "Checkout"
            button.isEnabled = !self.checkingOut
            button.configuration = config
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Checkout", for: .normal)
        button.addAction(
            UIAction(handler: { _ in
                self.checkingOut = true
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    self.checkingOut = false
                }
            }),
            for: .touchUpInside)
        return button
    }()
    
    private var checkingOut = false{
        didSet{
            //不設定這個會不停止
            checkoutButton.setNeedsUpdateConfiguration()
        }
    }
    
    init(){
        super.init(frame: CGRect.zero)
        backgroundColor = .secondarySystemBackground //先設別的顏色,比較可以看清楚
        //backgroundColor = .systemCyan
        //加入垂直stackView
        addSubview(stackView)
        
        //加入水平stackView
        stackView.addArrangedSubview(informationStackView)
        //水平stackView加入元素
        informationStackView.addArrangedSubview(costLabel)
        informationStackView.addArrangedSubview(shippingSpeedButton)
        
        stackView.addArrangedSubview(checkoutButton)
        
        //layout垂直stackView
        //stackView設顏色看的比較清楚
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 110),
            
            informationStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            checkoutButton.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
