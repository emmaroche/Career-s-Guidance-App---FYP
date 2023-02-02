//
//  NavigationController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 29/01/2023.
//

import UIKit

class NavigationController: UIViewController {
    
    var tabBarApparence = UITabBar.appearance()
//    private let nav = NavigationView()
    
    override func viewDidLoad() {
        let tabBarVc = UITabBarController()
        
        let vc1 = HomeController()
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = AccountPageController()
        
        vc1.title = "Home"
        vc2.title = "Quiz"
        vc3.title = "Results"
        vc4.title = "Account"
        
        
//                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)

//        UITabBar.appearance().backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
//
//        UITabBar.appearance().tintColor = UIColor.white
//
//        view.backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00);
//
//         // Sets the default color of the background of the UITabBar
//        UITabBar.appearance().barTintColor = UIColor.white

//        // Set color of titles and icons in tabBar
//        self.tabBarController?.tabBar.tintColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
//        // Set color of background tabBar
//        self.tabBarController?.tabBar.barTintColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
        
//        UITabBar.appearance().tintColor = .purple
//        UITabBar.appearance().barTintColor = .white
//        UITabBar.appearance().isOpaque = false
//        UITabBar.appearance().backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
        // Set color of titles and icons in tabBar
//        self.tabBarController?.tabBar.tintColor = UIColor.red
//        // Set color of background tabBar
//        self.tabBarController?.tabBar.barTintColor = UIColor.blue
        

        
        tabBarVc.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        
        guard let items = tabBarVc.tabBar.items else {
            return
        }
        
        let images = ["house", "star", "gear", "person.circle"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVc.modalPresentationStyle = .fullScreen
        present (tabBarVc, animated: true)
    }
  
    
}
    

    
    class FirstViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            self.title = "Home"
            
        }
    }
    
    class SecondViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            title = "Quiz"
            
        }
    }
    
    class ThirdViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            title = "Results"
            
        }
    }
    
    class FourthViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            title = "Account"
            
        }
    }
    

