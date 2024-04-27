//
//  WelcomeBackView.swift
//  TravellingApp
//
//  Created by Aizada on 02.04.2024.
//
import UIKit

final class WelcomeBackView: UIViewController {
    
    // MARK: - Properties
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back!"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "earth")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.backgroundColor = Colors.customBlue
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = UIColor.white
        textField.layer.borderColor = Colors.customBlue.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 20
        textField.isSecureTextEntry = true 
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        return button
    }()
    
    private let rememberMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Remember me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Colors.customBlue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapSignInButton() {
        let tabBarController = TabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    private let googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google"), for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 25
        return button
    }()
    
    private let facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private let appleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 25
        return button
    }()
    
    private lazy var socialStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleButton, facebookButton, appleButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an Account?"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let signUpHereButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 10),
            .foregroundColor: UIColor.white,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributedString = NSAttributedString(string: "Sign up here", attributes: attributes)
        
        button.setAttributedTitle(attributedString, for: .normal)
        
        return button
    }()
    
    
    private lazy var signUpStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dontHaveAccountLabel, signUpHereButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.view.backgroundColor = Colors.customBlue
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(whiteView)
        whiteView.addSubview(imageView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(rememberMeButton)
        view.addSubview(signInButton)
        view.addSubview(socialStackView)
        view.addSubview(signUpStackView)
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            whiteView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            whiteView.heightAnchor.constraint(equalToConstant: 600),
            
            imageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 208),
            imageView.heightAnchor.constraint(equalToConstant: 208),
            
            emailTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -25),
            
            rememberMeButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            rememberMeButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 25),
            
            signInButton.topAnchor.constraint(equalTo: rememberMeButton.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 25),
            signInButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -25),
            signInButton.heightAnchor.constraint(equalToConstant: 45),
            
            socialStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            socialStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpStackView.topAnchor.constraint(equalTo: socialStackView.bottomAnchor, constant: -10),
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStackView.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}
