//
//  CardModifier.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/04/2023.
//

import SwiftUI

// Code Resourse (modfied to fit to work in this app) https://www.danijelavrzan.com/posts/2023/02/card-view-swiftui/

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }

}

struct CardModifierColour: ViewModifier {

    
    func body(content: Content) -> some View {
        let height = UIScreen.main.bounds.height / 7
        
        ZStack {
            
            Rectangle()
                .fill(CustomColour.customBlueColour2)
                .frame(height: height)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
            
            Rectangle()
                .fill(Color.white)
                    .frame(height: height)
                    .offset(y: height / 3)
                    .cornerRadius(12)
            
            content
                .cornerRadius(12)
        }
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}
