//
//  HomeController.swift
//  CGA
//
//  Created by Emma Roche on 18/01/2023.
//

import UIKit
import SwiftUI

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
    
    private let homeView = HomeView(hLabel1: "Our mission is to help you find your \ndream course, personalised to your \nskills and interests.", hLabel2: "Take the Course Matching Questionnaire \nto find the course that will best suit you! ", hLabel3: "If you have previously completed the \nCourse Matching Questionnaire, you \ncan retake it at any time and/or view previous results." )
    
    private let cardImageView: UIButton = {
        let iv = UIButton()
        let img = UIImage(named: "card1")
        iv.setImage(img , for: .normal)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let cardImageView2: UIButton = {
        let iv = UIButton()
        let img = UIImage(named: "card2")
        iv.setImage(img , for: .normal)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    
        self.cardImageView.addTarget(self, action: #selector(didTapRetakeQuestionnaire), for: .touchUpInside)
        self.cardImageView2.addTarget(self, action: #selector(didTapResultsDashboard), for: .touchUpInside)
        
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
        
        self.view.addSubview(gap)
        self.view.addSubview(label)
        self.view.addSubview(homeView)
        self.view.addSubview(cardImageView)
        self.view.addSubview(cardImageView2)
        
        gap.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        homeView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView2.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            self.cardImageView.topAnchor.constraint(equalTo: homeView.bottomAnchor, constant: 270),
            self.cardImageView.centerXAnchor.constraint(equalTo: gap.centerXAnchor),
            self.cardImageView.widthAnchor.constraint(equalToConstant: 350),
            self.cardImageView.heightAnchor.constraint(equalToConstant: 140),
            
            self.cardImageView2.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 15),
            self.cardImageView2.centerXAnchor.constraint(equalTo: gap.centerXAnchor),
            self.cardImageView2.widthAnchor.constraint(equalToConstant: 350),
            self.cardImageView2.heightAnchor.constraint(equalToConstant: 140),
            
        ])
        
    }
    
    // MARK: - Selectors
    
    // The functions below keep the tab bar visable at the bottom of the screen when the card buttons are pressed
    @objc private func didTapRetakeQuestionnaire() {
        let quizScreen = UIHostingController(rootView: QuizScreen())
        quizScreen.title = "Quiz"
        quizScreen.tabBarItem.image = UIImage(systemName: "lightbulb.fill")
        if let viewControllers = self.tabBarController?.viewControllers {
            var updatedViewControllers = viewControllers
            updatedViewControllers[1] = quizScreen
            self.tabBarController?.setViewControllers(updatedViewControllers, animated: false)
            self.tabBarController?.selectedIndex = 1
        }
    }
    
    @objc private func didTapResultsDashboard() {
        let rdScreen = UIHostingController(rootView: ResultsDashboardController())
        rdScreen.title = "Results"
        rdScreen.tabBarItem.image = UIImage(systemName: "chart.bar.xaxis")
        if let viewControllers = self.tabBarController?.viewControllers {
            var updatedViewControllers = viewControllers
            updatedViewControllers[2] = rdScreen
            self.tabBarController?.setViewControllers(updatedViewControllers, animated: false)
            self.tabBarController?.selectedIndex = 2
        }
    }
    
    
}
