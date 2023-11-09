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
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        
        
        let button = UIButton(type: .system)
        button.configuration = config
        button.setTitle("Sign In", for: .normal)
        button.addAction(UIAction{
            _ in
            self.signingIn = true
            Timer.scheduledTimer(withTimeInterval: 1,
                                 repeats: false) {
                _ in
                self.signingIn = false
            }
            
            
        }, for: .touchUpInside)
        
        button.configurationUpdateHandler = {
            singInButton in
            var config = singInButton.configuration
            config?.showsActivityIndicator = self.signingIn
            config?.imagePlacement = self.signingIn ? .leading:.trailing
            button.configuration = config
            button.isEnabled = !self.signingIn
            print("執行updateHandler")
            
        }
        return button
    }()
    
    private var signingIn = false{
        didSet{
            signInButton.setNeedsUpdateConfiguration()
        }
    }
    
    private lazy var helpButton:UIButton = {
        var config = UIButton.Configuration.tinted()
        config.buttonSize = .large
        config.cornerStyle = .medium
        let button = UIButton(type: .system)
        button.configuration = config
        button.setTitle("Get Help", for: .normal)
        /*
        button.addAction(UIAction(handler: { _ in
            print("Get Help")
        }), for: .touchUpInside)
         */
        button.showsMenuAsPrimaryAction = true
        button.menu = UIMenu(children: [
            UIAction(title: "Forgot Password", image: UIImage(systemName: "key.fill"), handler: { _ in
                print("Forgot Password Tapped.")
            }),
            UIAction(title: "Contact Support", image: UIImage(systemName: "person.crop.circle.badge.questionmark"), handler: { _ in
                print("Contact Support Tapped")
            })
        ])
        return button
    }()
    
    //var scrollView:UIScrollView!
    
    override func loadView() {
        super.loadView()
        self.view = UIView()
        //scrollView = self.view as? UIScrollView
        view.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "SignIn Button"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
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
