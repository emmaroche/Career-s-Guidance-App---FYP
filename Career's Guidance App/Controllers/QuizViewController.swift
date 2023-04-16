//
//  QuizViewController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/02/2023.
//

import UIKit
import SwiftUI

class QuizViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "topScreenDesign")
        return iv
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Welcome!"
        label.numberOfLines = 2
        return label
    }()
    
    private let quizViews = QuizView(title: "Our mission is to help you find your dream course, personalised to your skills and interests.", subLabel: "Let's start by taking the Course Matching Questionnaire!", subLabel2: "To get the most accurate results choose the answers that relates to you the most.", subLabel3: "Please note that only one option is accepted per question." )

    private let getStartedButton = CustomButton(title: "Get Started", hasBackground: true, fontSize: .big)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.getStartedButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
            
            if let user = user {
                self.label.text = "Welcome, \(user.username.capitalized)!"
            }
        }
        
        overrideUserInterfaceStyle = .light
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(label)
        self.view.addSubview(quizViews)
        self.view.addSubview(getStartedButton)

    
        //enables autolayout for view
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        quizViews.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            self.logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.logoImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.logoImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 230),


            self.label.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            self.label.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor),
            self.label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.quizViews.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            self.quizViews.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor),
            self.quizViews.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            self.getStartedButton.topAnchor.constraint(equalTo: quizViews.bottomAnchor, constant: 400),
            self.getStartedButton.centerXAnchor.constraint(equalTo: quizViews.centerXAnchor),
            self.getStartedButton.heightAnchor.constraint(equalToConstant: 55),
            self.getStartedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
    }
    
    // MARK: - Selectors
    @objc func didTapButton(){
        //SwiftUI interop
        let vc = UIHostingController(rootView: QuizScreen())
        present(vc, animated: true)
    }

}
