//
//  HomeController.swift
//  CGA
//
//  Created by Emma Roche on 18/01/2023.
//

import UIKit


class HomeController: UIViewController {
    
    // MARK: - UI Components
    
    
    private let gap = BasicText(text: "")
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Welcome!"
        label.numberOfLines = 2
        return label
    }()
    
    private let homeView = HomeView(hLabel1: "Our mission is to help you find your dream course, personalised to your skills and interests.", hLabel2: "Take the Course Matching Questionnaire to find the course that will best suit you! ", hLabel3: "You have previously completed the Course Matching Questionnaire, you can retake the Questionnaire at any time or view previous results." )
    

    private let logoImageView: UIButton = {
        let iv = UIButton()
        let img = UIImage(named: "card")
        iv.setImage(img , for: .normal)
        return iv
    }()


    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
      
        
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
        
//        self.logoImageView.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//
        overrideUserInterfaceStyle = .light
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(gap)
        self.view.addSubview(label)
        self.view.addSubview(homeView)
        self.view.addSubview(logoImageView)

        
        //enables autolayout for view
        gap.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        homeView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([

            self.gap.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.gap.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.gap.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.gap.heightAnchor.constraint(equalToConstant: 40),
            
            self.label.topAnchor.constraint(equalTo: gap.bottomAnchor, constant: 40),
            self.label.centerXAnchor.constraint(equalTo: gap.centerXAnchor),
            self.label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            self.homeView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            self.homeView.centerXAnchor.constraint(equalTo: gap.centerXAnchor),
            self.homeView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.logoImageView.topAnchor.constraint(equalTo: homeView.bottomAnchor, constant: 270),
            self.logoImageView.centerXAnchor.constraint(equalTo: gap.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 350),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 300),
            
        ])
    }
    
//    @objc private func didTapButton() {
//        let vc = LoginController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
}
