

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    var presenter: RegistrationPresenterProtocol? { get set }
    func showRegistrationError(_ error: Error)
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
    
    private let rememberMeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let checkboxImageView = UIImageView(image: UIImage(systemName: "square"))
        checkboxImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Remember me"
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        
        button.addSubview(checkboxImageView)
        button.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            checkboxImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 0),
            checkboxImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            checkboxImageView.widthAnchor.constraint(equalToConstant: 20),
            checkboxImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: checkboxImageView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: button.centerYAnchor),
        ])
        
        button.addTarget(self, action: #selector(didTapRememberMeButton), for: .touchUpInside)
        return button
    }()

    private var isRemembered: Bool = false {
        didSet {
            if let checkboxImageView = rememberMeButton.subviews.first(where: { $0 is UIImageView }) as? UIImageView {
                checkboxImageView.image = isRemembered ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "square")
            }
        }
    }

    @objc private func didTapRememberMeButton(sender: UIButton) {
        isRemembered.toggle()
    }

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Colors.customBlue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTaploginButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTaploginButton() {
        let welcomeBackView = WelcomeBackView()
        navigationController?.pushViewController(welcomeBackView, animated: true)
    }
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(Colors.customBlue, for: .normal)
        button.layer.borderColor =  Colors.customBlue.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapCreateAccountButton() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        presenter?.registerUser(username: email, password: password)
    }
    
    func showRegistrationError(_ error: Error) {
            let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        print("Registration error: \(error.localizedDescription)")
        }
    
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
        view.addSubview(rememberMeButton)
        view.addSubview(loginButton)
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
            
            rememberMeButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            rememberMeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            loginButton.topAnchor.constraint(equalTo: rememberMeButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createAccountButton.heightAnchor.constraint(equalToConstant: 44),
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
