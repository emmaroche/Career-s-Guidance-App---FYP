//
//  AccountPageController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 29/01/2023.
//

import UIKit

class AccountPageController: UIViewController {
        
        private let headerView = AccountView(title: "Account Settings")
        
        private let signUpButton = CustomButton(title: "Log out", hasBackground: true, fontSize: .med)
        
        // MARK: - UI Components
        
        //Crete outline around text labels Code Reference: https://stackoverflow.com/questions/74048697/how-do-i-create-a-text-box-view-in-ios-programmatically
        
        lazy var mainView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.lightGray.cgColor
            view.layer.cornerRadius = 15
            return view
        }()
        
        lazy var label: UILabel = {
            let label = UILabel()
            label.textColor = .label
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 18)
            label.text = " "
            label.numberOfLines = 2
            return label
        }()
        
        lazy var separator: UILabel = {
            let line = UILabel()
            line.textColor = .label
            line.textAlignment = .center
            line.font = UIFont.systemFont(ofSize: 18)
            line.text = "⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯"
            line.numberOfLines = 2
            return line
        }()
        
        lazy var label2: UILabel = {
            let label2 = UILabel()
            label2.textColor = .label
            label2.textAlignment = .left
            label2.font = UIFont.systemFont(ofSize: 18)
            label2.text = " "
            label2.numberOfLines = 2
            return label2
        }()
        
        lazy var separator2: UILabel = {
            let line2 = UILabel()
            line2.textColor = .label
            line2.textAlignment = .center
            line2.font = UIFont.systemFont(ofSize: 18)
            line2.text = "⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯"
            line2.numberOfLines = 2
            return line2
        }()
        
        
        lazy var descriptionLabel: UILabel = {
            let descriptionLabel = UILabel()
            descriptionLabel.textColor = .label
            descriptionLabel.textAlignment = .left
            descriptionLabel.font = UIFont.systemFont(ofSize: 18)
            descriptionLabel.text = "Change Password"
            descriptionLabel.numberOfLines = 2
            return descriptionLabel
        }()


    func addElements() {
        self.view.addSubview(self.mainView)
        self.mainView.addSubview(self.label)
        self.mainView.addSubview(self.separator)
        self.mainView.addSubview(self.label2)
        self.mainView.addSubview(self.separator2)
        self.mainView.addSubview(self.descriptionLabel)
        
        self.view.addSubview(headerView)
        self.view.addSubview(signUpButton)

    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setupUI()
        
        self.addElements()
        self.setupConstraints()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
            
            if let user = user {
                self.label.text = "\(user.username.capitalized)"
                self.label2.text = "\(user.email)"
            }
        }
        
        self.signUpButton.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        overrideUserInterfaceStyle = .light
        
        view.backgroundColor = .white
        
    }
        
        // MARK: - UI Setup
        private func setupUI() {
            self.view.backgroundColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            separator.translatesAutoresizingMaskIntoConstraints = false
            label2.translatesAutoresizingMaskIntoConstraints = false
            separator2.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.translatesAutoresizingMaskIntoConstraints = false
            signUpButton.translatesAutoresizingMaskIntoConstraints = false
        }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([

            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 228),
            
            self.mainView.topAnchor.constraint(equalTo: self.headerView.layoutMarginsGuide.topAnchor,constant: 225),
            self.mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.label.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: 50),
            self.label.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 20),
            self.label.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -20),
            
            self.separator.topAnchor.constraint(equalTo: self.label.topAnchor, constant: 30),
            self.separator.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 20),
            self.separator.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -20),

            self.label2.topAnchor.constraint(equalTo: self.separator.topAnchor, constant: 35),
            self.label2.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 20),
            self.label2.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -20),
            
            self.separator2.topAnchor.constraint(equalTo: self.label2.topAnchor, constant: 35),
            self.separator2.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 20),
            self.separator2.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -20),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.separator2.bottomAnchor, constant: 10),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 20),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -20),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.mainView.bottomAnchor, constant: -50),
            
            self.signUpButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 100),
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


