//
//  HomeView.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 20/02/2023.
//

import UIKit

class HomeView: UIView {

    // MARK: - UI Components
    
    private let homeLabel1: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Error"
        label.numberOfLines = 3
        return label
    }()
    
    private let homeLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Error"
        label.numberOfLines = 2
        return label
    }()
    
    private let homeLabel3: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Error"
        label.numberOfLines = 4
        return label
    }()
    
    // MARK: - LifeCycle
    init(hLabel1: String, hLabel2: String, hLabel3: String) {
        super.init(frame: .zero)
        self.homeLabel1.text = hLabel1
        self.homeLabel2.text = hLabel2
        self.homeLabel3.text = hLabel3
        self.setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.addSubview(homeLabel1)
        self.addSubview(homeLabel2)
        self.addSubview(homeLabel3)
        
        homeLabel1.translatesAutoresizingMaskIntoConstraints = false
        homeLabel2.translatesAutoresizingMaskIntoConstraints = false
        homeLabel3.translatesAutoresizingMaskIntoConstraints = false



        NSLayoutConstraint.activate([

            
            self.homeLabel1.topAnchor.constraint(equalTo: self.topAnchor),
            self.homeLabel1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.homeLabel1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            

            self.homeLabel2.topAnchor.constraint(equalTo: self.homeLabel1.topAnchor, constant: 90),
            self.homeLabel2.leadingAnchor.constraint(equalTo: self.homeLabel1.leadingAnchor, constant: 0),
            self.homeLabel2.trailingAnchor.constraint(equalTo: self.homeLabel1.trailingAnchor, constant: -0),
            

            self.homeLabel3.topAnchor.constraint(equalTo: self.homeLabel2.topAnchor, constant: 70),
            self.homeLabel3.leadingAnchor.constraint(equalTo: self.homeLabel1.leadingAnchor, constant: 0),
            self.homeLabel3.trailingAnchor.constraint(equalTo: self.homeLabel1.trailingAnchor, constant: -0),
            
        ])
    }
}
