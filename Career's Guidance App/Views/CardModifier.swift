//
//  CardModifier.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/04/2023.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
    
}
