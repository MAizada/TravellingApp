

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    var presenter: RegistrationPresenterProtocol? { get set }
}

final class RegistrationView: UIViewController, RegistrationViewProtocol {
    
    var presenter: RegistrationPresenterProtocol?
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Let’s start your \nJourney together!"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "earth")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.borderStyle = .none
        return textField
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.borderStyle = .none
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .none
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
    
    private let rememberMeCheckbox: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "checkbox_empty"), for: .normal)
        button.setImage(UIImage(named: "checkbox_filled"), for: .selected)
        return button
    }()
    
    private let checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "checkmark_empty")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        let welcomeBackView = WelcomeBackView()
        navigationController?.pushViewController(welcomeBackView, animated: true)
    }
    
    private let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an Account?"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(Colors.customBlue, for: .normal)
        button.layer.borderColor =  Colors.customBlue.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(rememberMeButton)
        view.addSubview(rememberMeCheckbox)
        view.addSubview(signInButton)
        view.addSubview(dontHaveAccountLabel)
        view.addSubview(createAccountButton)
        
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 400),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 208),
            imageView.heightAnchor.constraint(equalToConstant: 208),
            
            emailLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            usernameLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            rememberMeButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            rememberMeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            rememberMeCheckbox.centerYAnchor.constraint(equalTo: rememberMeButton.centerYAnchor),
            rememberMeCheckbox.leadingAnchor.constraint(equalTo: rememberMeButton.trailingAnchor, constant: 10),
            rememberMeCheckbox.widthAnchor.constraint(equalToConstant: 20),
            rememberMeCheckbox.heightAnchor.constraint(equalToConstant: 20),
            
            signInButton.topAnchor.constraint(equalTo: rememberMeButton.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            
            dontHaveAccountLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 25),
            dontHaveAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dontHaveAccountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            createAccountButton.topAnchor.constraint(equalTo: dontHaveAccountLabel.bottomAnchor, constant: 25),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createAccountButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
        
        emailTextField.addSubview(checkmarkImageView)
        usernameTextField.addSubview(checkmarkImageView.copy())
        passwordTextField.addSubview(checkmarkImageView.copy())
        
        NSLayoutConstraint.activate([
            checkmarkImageView.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            checkmarkImageView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: -10),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 20),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let emailUnderline = UIView()
        emailUnderline.translatesAutoresizingMaskIntoConstraints = false
        emailUnderline.backgroundColor = Colors.customBlue
        
        let usernameUnderline = UIView()
        usernameUnderline.translatesAutoresizingMaskIntoConstraints = false
        usernameUnderline.backgroundColor = Colors.customBlue
        
        let passwordUnderline = UIView()
        passwordUnderline.translatesAutoresizingMaskIntoConstraints = false
        passwordUnderline.backgroundColor = Colors.customBlue
        
        view.addSubview(emailUnderline)
        view.addSubview(usernameUnderline)
        view.addSubview(passwordUnderline)
        
        NSLayoutConstraint.activate([
            emailUnderline.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 1),
            emailUnderline.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailUnderline.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailUnderline.heightAnchor.constraint(equalToConstant: 1),
            
            usernameUnderline.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 1),
            usernameUnderline.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameUnderline.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameUnderline.heightAnchor.constraint(equalToConstant: 1),
            
            passwordUnderline.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 1),
            passwordUnderline.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordUnderline.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordUnderline.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension UIImageView {
    func copy() -> UIImageView {
        let newImageView = UIImageView(image: self.image)
        newImageView.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints
        newImageView.contentMode = self.contentMode
        return newImageView
    }
}
