//
//  RegisterController.swift
//  CGA
//
//  Created by Emma Roche on 18/01/2023.
//

import UIKit

class RegisterController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create an account")
    
    private let usernameField = CustomTextField(fieldType: .firstName)
    
    private let emailField = CustomTextField(fieldType: .email)
    
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let ConfirmPasswordField = CustomTextField(fieldType: .confirmPassword)
    
    private let signUpButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .biglol)
    
    private let lineSeparator = LineView(lineWithOr: "⎯⎯⎯⎯⎯⎯⎯  or  ⎯⎯⎯⎯⎯⎯⎯")
        
    private let text = BasicText(text: "Already have an account?")

    private let signInButton = CustomSButton(title: "Log in", hasBackground: true, fontSize: .bigSb)

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        overrideUserInterfaceStyle = .light
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(ConfirmPasswordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(lineSeparator)
        self.view.addSubview(text)
        self.view.addSubview(signInButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        ConfirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 115),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 22),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.ConfirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.ConfirmPasswordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.ConfirmPasswordField.heightAnchor.constraint(equalToConstant: 55),
            self.ConfirmPasswordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: ConfirmPasswordField.bottomAnchor, constant: 44),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.lineSeparator.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 25),
            self.lineSeparator.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.lineSeparator.heightAnchor.constraint(equalToConstant: 45),
            self.lineSeparator.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.text.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor, constant: 8),
            self.text.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.text.heightAnchor.constraint(equalToConstant: 25),
            self.text.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 25),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    // MARK: - Selectors
    @objc func didTapSignUp() {
        let registerUserRequest = RegiserUserRequest(
            firstName: self.usernameField.text ?? "",
            email: self.emailField.text ?? "",
            password: self.passwordField.text ?? "",
            confirmPassword: self.ConfirmPasswordField.text ?? ""
        )
        
        // Username check
        if !Validator.isValidUsername(for: registerUserRequest.firstName) {
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        
        // Email check
        if !Validator.isValidEmail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isPasswordValid(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        //Check password
        if ConfirmPasswordField.text! != passwordField.text! {
            AlertManager.showInvalidCheckPasswordAlert(on: self)
            return

        }

        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self] wasRegistered, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
    }
    
    @objc private func didTapSignIn() {
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
