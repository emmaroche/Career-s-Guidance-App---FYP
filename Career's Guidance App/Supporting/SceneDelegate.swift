//
//  SceneDelegate.swift
//  CGA
//
//  Created by Emma Roche on 18/01/2023.
//


import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        self.checkAuthentication()
    }
    
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .light
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    public func checkAuthentication() {
        if Auth.auth().currentUser == nil {
            self.goToController(with: WelcomeController())
        } else {
            self.goToController(with: NavigationTabBarController())
        }
    }
    
    public func checkAuthenticationGuestLogin() {
        if Auth.auth().currentUser == nil {
            self.goToController(with: LoginController())
        } else {
            self.goToController(with: GuestNavigation())
        }
    }
    
    
    public func checkAuthenticationGuestSignup() {
        if Auth.auth().currentUser == nil {
            self.goToController(with: RegisterController())
        } else {
            self.goToController(with: GuestNavigation())
        }
    }
    
    private func goToController(with viewController: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.25) {
                self?.window?.layer.opacity = 0
                
            } completion: { [weak self] _ in
                
                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController = nav
                
                UIView.animate(withDuration: 0.25) { [weak self] in
                    self?.window?.layer.opacity = 1
                }
            }
        }
    }
}

