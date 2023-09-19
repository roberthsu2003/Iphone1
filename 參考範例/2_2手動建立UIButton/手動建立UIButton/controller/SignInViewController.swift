//
//  SignInViewController.swift
//  手動建立UIButton
//
//  Created by 徐國堂 on 2023/9/16.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView()
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
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{
            incoming in
            var outgoing = incoming
            outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
            return outgoing
        }
         
        config.image = UIImage(systemName: "chevron.right")
        config.imagePadding = 5
        config.imagePlacement = .trailing
        config.preferredSymbolConfigurationForImage =  UIImage.SymbolConfiguration(scale: .medium)
        
        let button = UIButton(type: .system)
        button.configuration = config
        button.configurationUpdateHandler = {
            [unowned self] button in
            var config = button.configuration
            config?.showsActivityIndicator = self.signingIn
            config?.imagePlacement = self.signingIn ? .leading: .trailing
            button.configuration = config
            button.isEnabled = !self.signingIn
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.addAction(UIAction{ _ in
            self.signingIn = true
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                self.signingIn = false
            }
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var helpButton:UIButton = {
        var config = UIButton.Configuration.tinted()
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Help", for: .normal)
        button.menu = UIMenu(children: [
            UIAction(title: "Forgot Password", image: UIImage(systemName: "key.fill")){ _ in
                print("Forgot Password Tapped")
            },
            UIAction(title: "Contact Support", image: UIImage(systemName: "person.crop.circle.badge.questionmark")){ _ in
                print("Contact Support Tapped")
            }
        ])
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    private var signingIn = false {
        didSet{
            signInButton.setNeedsUpdateConfiguration()
        }
    }
    
    
    
    override func loadView() {
        self.view = UIView()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .close , primaryAction: UIAction{ _ in
            self.dismiss(animated: true)
        })
         */
        navigationItem.title = "button_state_update,menu_button"
        view.addSubview(stackView)
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(helpButton)
        
        stackView.setCustomSpacing(125, after: logoImageView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            logoImageView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 1/4),
            logoImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            signInButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            helpButton.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
    


}
