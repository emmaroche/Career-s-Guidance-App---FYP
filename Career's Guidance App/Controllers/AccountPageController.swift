//
//  AccountPageController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 29/01/2023.
//

import UIKit

class AccountPageController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = AccountView(title: "Account Settings")
    
    private let signUpButton = CustomButton(title: "Log out", hasBackground: true, fontSize: .med)

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setupUI()
    
        self.signUpButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        overrideUserInterfaceStyle = .light
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    
    // MARK: - UI Setup
    private func setupUI() {
    
        self.view.backgroundColor = .white
        
        self.view.addSubview(headerView)
        self.view.addSubview(signUpButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 228),

            self.signUpButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 450),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 45),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
    }
    

    // MARK: - Selectors
    @objc private func didTapLogout() {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
}
