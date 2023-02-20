//
//  QuizView.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 20/02/2023.
//

import UIKit

class QuizView: UIView {
    
    // MARK: - UI Components
    
    private let welcomeLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Error"
//        label.numberOfLines = 3
        return label
    }()
    
    private let welcomeLabelContinued: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Error"
        label.numberOfLines = 3
        return label
    }()
    
    private let subWelcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Error"
        label.numberOfLines = 2
        return label
    }()
    
    private let subWelcomeLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Error"
        label.numberOfLines = 3
        return label
    }()
    
    private let subWelcomeLabel3: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Error"
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - LifeCycle
    init(title: String, subTitle: String, subLabel: String, subLabel2: String, subLabel3: String) {
        super.init(frame: .zero)
        self.welcomeLabel.text = title
        self.welcomeLabelContinued.text = subTitle
        self.subWelcomeLabel.text = subLabel
        self.subWelcomeLabel2.text = subLabel2
        self.subWelcomeLabel3.text = subLabel3
        self.setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.addSubview(welcomeLabel)
        self.addSubview(welcomeLabelContinued)
        self.addSubview(subWelcomeLabel)
        self.addSubview(subWelcomeLabel2)
        self.addSubview(subWelcomeLabel3)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabelContinued.translatesAutoresizingMaskIntoConstraints = false
        subWelcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        subWelcomeLabel2.translatesAutoresizingMaskIntoConstraints = false
        subWelcomeLabel3.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([

            
            self.welcomeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.welcomeLabelContinued.topAnchor.constraint(equalTo: self.welcomeLabel.topAnchor, constant: 70),
            self.welcomeLabelContinued.leadingAnchor.constraint(equalTo: self.welcomeLabel.leadingAnchor, constant: 3),
            self.welcomeLabelContinued.trailingAnchor.constraint(equalTo: self.welcomeLabel.trailingAnchor, constant: -3),
        
            self.subWelcomeLabel.topAnchor.constraint(equalTo: self.welcomeLabelContinued.topAnchor, constant: 90),
            self.subWelcomeLabel.leadingAnchor.constraint(equalTo: self.welcomeLabel.leadingAnchor, constant: 3),
            self.subWelcomeLabel.trailingAnchor.constraint(equalTo: self.welcomeLabel.trailingAnchor, constant: -3),
            
            self.subWelcomeLabel2.topAnchor.constraint(equalTo: self.subWelcomeLabel.topAnchor, constant: 70),
            self.subWelcomeLabel2.leadingAnchor.constraint(equalTo: self.welcomeLabel.leadingAnchor, constant: 3),
            self.subWelcomeLabel2.trailingAnchor.constraint(equalTo: self.welcomeLabel.trailingAnchor, constant: -3),
            
            self.subWelcomeLabel3.topAnchor.constraint(equalTo: self.subWelcomeLabel2.topAnchor, constant: 70),
            self.subWelcomeLabel3.leadingAnchor.constraint(equalTo: self.welcomeLabel.leadingAnchor, constant: 3),
            self.subWelcomeLabel3.trailingAnchor.constraint(equalTo: self.welcomeLabel.trailingAnchor, constant: -3),
            
        ])
    }
}
