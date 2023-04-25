//
//  AlertManager.swift
//  CGA
//
//  Created by Emma Roche on 20/01/2023.
//

// Code Resource for authetication errors (modfied to work with this apps content): https://www.youtube.com/watch?v=bFdHM7lxFW0&t=113s

import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}

// MARK: - Show Validation Alerts

extension AlertManager {
    
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email address.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Incorrect Password", message: "Please enter a valid password.")
    }
    
    public static func showInvalidPasswordAlertSignUp(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Your password should contain both lowercase and uppercase characters as well as at least one number and symbol.")
    }
    
    public static func showInvalidCheckPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Passwords do not match", message: "Confirm password does not match password.")
    }
    
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Username", message: "Your password should contain 1 or more chracters and no numbers.")
    }
}


// MARK: - Registration Errors

extension AlertManager {
    
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: "\(error.localizedDescription)")
    }
}


// MARK: - Log In Errors

extension AlertManager {
    
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Error Signing In", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Signing In", message: "\(error.localizedDescription)")
    }
}


// MARK: - Logout Errors

extension AlertManager {
    
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Log Out Error", message: "\(error.localizedDescription)")
    }
}


// MARK: - Forgot Password Errors

extension AlertManager {

    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password Reset Sent", message: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Sending Password Reset", message: "\(error.localizedDescription)")
    }
}


// MARK: - Fetching User Errors

extension AlertManager {
    
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Fetching User", message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchingUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Error Fetching User", message: nil)
    }
}
