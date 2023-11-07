//
//  SignInViewController.swift
//  lesson19_2
//
//  Created by 徐國堂 on 2023/11/7.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .secondarySystemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var logoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "launchLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var signInButton:UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.cornerStyle = .medium
        config.image = UIImage(systemName: "chevron.right")
        config.imagePlacement = .trailing
        config.imagePadding = 5
        
        
        let button = UIButton()
        button.configuration = config
        button.setTitle("Sign In", for: .normal)
        return button
    }()
    
    private lazy var helpButton:UIButton = {
        var config = UIButton.Configuration.tinted()
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        
        let button = UIButton(type: .system)
        button.configuration = config
        button.setTitle("Get Help", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "SignIn Button"
        view.addSubview(stackView)
        
        //加入圖片
        stackView.addArrangedSubview(logoImageView)
        //加入signIn button
        stackView.addArrangedSubview(signInButton)
        //加入Help Button
        stackView.addArrangedSubview(helpButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            logoImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 6/7),
            signInButton.heightAnchor.constraint(equalTo: helpButton.heightAnchor, multiplier: 1/1),
            signInButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1/1),
            helpButton.widthAnchor.constraint(equalTo: signInButton.widthAnchor, multiplier: 1/1)
            
        ])
    }

}
