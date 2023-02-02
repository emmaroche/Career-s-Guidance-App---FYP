//
//  NavigationTabBarController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 02/02/2023.
//

import UIKit

class NavigationTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeController()
        let account = AccountPageController()
        
        homeVC.title = "Home"
        account.title = "Account"
        
    
        self.setViewControllers([homeVC, account], animated: false)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        let images = ["house", "person.circle"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        UITabBar.appearance().backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
        
        UITabBar.appearance().tintColor = UIColor(red: 0.53, green: 0.72, blue: 0.52, alpha: 1.00)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        
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

