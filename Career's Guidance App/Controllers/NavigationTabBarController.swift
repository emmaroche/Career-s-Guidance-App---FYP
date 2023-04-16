//
//  NavigationTabBarController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 02/02/2023.
//

import UIKit
import SwiftUI

class NavigationTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeController()
        let quizScreen = UIHostingController(rootView: QuizScreen())
        let resultsDashboard = UIHostingController(rootView: ResultsDashboardController())
        let account = AccountPageController()
        
        homeVC.title = "Home"
        quizScreen.title = "Quiz"
        resultsDashboard.title = "Results"
        account.title = "Account"

        self.setViewControllers([homeVC, quizScreen, resultsDashboard, account], animated: false)
        
        guard let items = self.tabBar.items else {
            return
        }
    
        let images = ["house.fill", "lightbulb.fill", "chart.bar.xaxis", "person.fill"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        // Code resource used to stop Scroll bar from putting a grey cast on the navigation:https://stackoverflow.com/questions/69924596/swift-navigation-navigation-bar-changes-its-background-color-when-scroll-the and Code resource for making the unselected items stay white (as they kept defaulting to grey) https://stackoverflow.com/questions/56839374/uitabbaritem-icon-not-colored-correctly-for-ios-13-when-a-bar-tint-color-is-spec
        
        if #available(iOS 15, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .white
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
            tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            UITabBar.appearance().standardAppearance = tabBarAppearance
        } else {
            UITabBar.appearance().unselectedItemTintColor = .white
        }

        UITabBar.appearance().backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
        
        UITabBar.appearance().tintColor = UIColor(red: 0.53, green: 0.72, blue: 0.52, alpha: 1.00)
        
        
        overrideUserInterfaceStyle = .light
    }
    
    // Increase heigh of tab bar. Code referennce: https://stackoverflow.com/questions/71159924/change-position-of-uitabbarbutton-in-tab-bar
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         // Increase by 16 pt.
         let newTabBarHeight = tabBar.frame.size.height + 16

         var newFrame = tabBar.frame
         newFrame.size.height = newTabBarHeight
         newFrame.origin.y = view.frame.size.height - newTabBarHeight

         tabBar.frame = newFrame
     }
    
    
}

