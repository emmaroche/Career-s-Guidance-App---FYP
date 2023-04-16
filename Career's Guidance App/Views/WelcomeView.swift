//
//  WelcomeView.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 26/01/2023.
//

import UIKit

class WelcomeView: UIView {
    
    // MARK: - UI Components
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let welcomeLabelContinued: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    private let subWelcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    private let subWelcomeLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    // MARK: - LifeCycle
    
    init(title: String, subTitle: String, subLabel: String, subLabel2: String) {
        super.init(frame: .zero)
        self.welcomeLabel.text = title
        self.welcomeLabelContinued.text = subTitle
        self.subWelcomeLabel.text = subLabel
        self.subWelcomeLabel2.text = subLabel2
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    
    private func setupUI() {
        
        self.addSubview(welcomeLabel)
        self.addSubview(welcomeLabelContinued)
        self.addSubview(logoImageView)
        self.addSubview(subWelcomeLabel)
        self.addSubview(subWelcomeLabel2)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabelContinued.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        subWelcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        subWelcomeLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.welcomeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            self.welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.welcomeLabelContinued.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12),
            self.welcomeLabelContinued.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.welcomeLabelContinued.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.logoImageView.topAnchor.constraint(equalTo: welcomeLabelContinued.bottomAnchor, constant: 12),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 200),
            self.logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            self.subWelcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 12),
            self.subWelcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subWelcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.subWelcomeLabel2.topAnchor.constraint(equalTo: subWelcomeLabel.bottomAnchor, constant: 12),
            self.subWelcomeLabel2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subWelcomeLabel2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
   
        ])
    }
}
