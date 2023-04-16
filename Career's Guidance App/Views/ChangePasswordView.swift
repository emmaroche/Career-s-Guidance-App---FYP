//
//  ChangePasswordView.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/04/2023.
//

import SwiftUI

// https://developer.apple.com/documentation/swiftui/uiviewcontrollerrepresentable/makeuiviewcontroller(context:)

struct ChangePasswordView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ChangePasswordController {
        return ChangePasswordController()
    }
    
    func updateUIViewController(_ uiViewController: ChangePasswordController, context: Context) {
    }
    
    typealias UIViewControllerType = ChangePasswordController
    
}
