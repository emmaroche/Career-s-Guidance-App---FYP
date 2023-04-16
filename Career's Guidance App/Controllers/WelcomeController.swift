//
//  WelcomeController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 26/01/2023.
//

import UIKit


class WelcomeController: UIViewController {
    
    
    // MARK: - UI Components
    
    private let headerView2 = WelcomeView(title: "Welcome to", subTitle: "The Careers Guidance App!", subLabel: "We want to help you make the", subLabel2: "right choice for your future")
    
    private let signInButton = CustomButton(title: "Log in", hasBackground: true, fontSize: .big)
    
    private let lineSeparator = LineView(lineWithOr: "⎯⎯⎯⎯⎯⎯⎯  or  ⎯⎯⎯⎯⎯⎯⎯")
    
    private let signUpButton = CustomButton(title: "Create an account", hasBackground: true, fontSize: .big)
    
    private let guestButton = CustomSButton(title: "Continue as Guest", hasBackground: true, fontSize: .bigSb)
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.guestButton.addTarget(self, action: #selector(didTapGuest), for: .touchUpInside)
        overrideUserInterfaceStyle = .light
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.view.backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
        
        self.view.addSubview(headerView2)
        self.view.addSubview(signInButton)
        self.view.addSubview(lineSeparator)
        self.view.addSubview(signUpButton)
        self.view.addSubview(guestButton)
        
        headerView2.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        guestButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.headerView2.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView2.heightAnchor.constraint(equalToConstant: 400),
            
            self.signInButton.topAnchor.constraint(equalTo: headerView2.bottomAnchor, constant: 25),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView2.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 35),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView2.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.lineSeparator.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 35),
            self.lineSeparator.centerXAnchor.constraint(equalTo: headerView2.centerXAnchor),
            self.lineSeparator.heightAnchor.constraint(equalToConstant: 55),
            self.lineSeparator.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.guestButton.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor, constant: 15),
            self.guestButton.centerXAnchor.constraint(equalTo: headerView2.centerXAnchor),
            self.guestButton.heightAnchor.constraint(equalToConstant: 55),
            self.guestButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
    }
    
    // MARK: - Selectors
    
    @objc private func didTapSignIn() {
        let vc = LoginController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapSignUp() {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapGuest() {
        let vc = NavigationTabBarController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
