//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 26.08.2024.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPress()
}

class LoginViewController: UIViewController {

    //MARK: - Properties
    private var state: LoginViewState = .initial
    var viewOutput: LoginViewOutput!
    
    //MARK: - Views
    private lazy var bottomView = FoodDeliveryBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FoodDeliveryTextField()
    private lazy var signInPassword = FoodDeliveryTextField()
    private lazy var signUpUsername = FoodDeliveryTextField()
    private lazy var signUpPassword = FoodDeliveryTextField()
    private lazy var signUpReEnterPassword = FoodDeliveryTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FoodDeliveryButton()
    private lazy var signUpButton = FoodDeliveryButton()
    private lazy var verticalStack = UIStackView()
    
    //MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

//MARK: - Layout
private extension LoginViewController {
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signIn:
            setupBottomView()
            setupStack()
            setupSignInPassword()
            setupSignInUsername()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        case .signUp:
            setupBottomView()
            setupStack()
            setupSignUpPassword()
            setupSignUpUsername()
            setupSignUpReEnterPassword()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        }
        view.backgroundColor = AppColors.white
    }
    func setupStack() {
        view.addSubview(verticalStack)
        
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        switch state {
        case .initial:
            return
        case .signIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -262)
                
            ])
        case .signUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnterPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -227)
                
            ])
        }
    }
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        bottomView.buttonActionOne = googlePress
        bottomView.buttonACtionTwo = facebookPress
    }
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.font = .Roboto.bold.size(of: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        switch state {
        case .initial:
            return
        case .signIn:
            titleLabel.text = "Sign In"
        case .signUp:
            titleLabel.text = "Sign Up"
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38)
        ])
    }
    func googlePress() {
        print("Google!")
    }
    func facebookPress() {
        print("Facebook!")
    }
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.image = UIImage(resource: .appstore)
        logoImage.layer.cornerRadius = 30
        logoImage.clipsToBounds = true
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60),
            logoImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 57),
            logoImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
    }
    func setupSignInPassword() {
        signInPassword.placeholder = "Password"
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignInUsername() {
        signInUsername.placeholder = "Username"
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInUsername.leadingAnchor.constraint(equalTo: signInPassword.leadingAnchor),
            signInUsername.trailingAnchor.constraint(equalTo: signInPassword.trailingAnchor),
            signInUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.scheme = .orange
        signInButton.action = onSignInTapped
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        switch state {
        case .initial:
            signInButton.setTitle("Sign In")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signIn:
            signInButton.setTitle("Sign In")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            signInButton.setTitle("Sign Up")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        
        forgotLabel.text = "Forgot Password?"
        forgotLabel.font = .Roboto.regular.size(of: 14)
        forgotLabel.textColor = AppColors.darkGray
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    func setupSignUpPassword() {
        signUpPassword.placeholder = "Password"
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpUsername() {
        signUpUsername.placeholder = "Username"
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpUsername.leadingAnchor.constraint(equalTo: signUpPassword.leadingAnchor),
            signUpUsername.trailingAnchor.constraint(equalTo: signUpPassword.trailingAnchor),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpReEnterPassword() {
        signUpReEnterPassword.placeholder = "Re-enter Password"
        signUpReEnterPassword.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpReEnterPassword.leadingAnchor.constraint(equalTo: signUpPassword.leadingAnchor),
            signUpReEnterPassword.trailingAnchor.constraint(equalTo: signUpPassword.trailingAnchor),
            signUpReEnterPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.scheme = .gray
        signUpButton.setTitle("Sign Up")
        signUpButton.action = onSignUpTapped
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInput {
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.gotoSignUp()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    func onBackPress() {
        
    }
}

//#Preview("LoginViewController") {
//    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
//}
