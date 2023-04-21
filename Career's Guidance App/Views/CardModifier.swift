//
//  CardModifier.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/04/2023.
//

import SwiftUI

// https://www.danijelavrzan.com/posts/2023/02/card-view-swiftui/

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }

}

//struct CardModifierColour: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .cornerRadius(12)
//            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
//            .overlay(
//                RoundedRectangle(cornerRadius: 12)
//                    .fill(Color.blue)
//                    .frame(height: 30)
//                    .padding(.top, 10),
//                alignment: .top
//            )
//    }
//}

//struct CardModifierColour: ViewModifier {
//    var gradientColors: [Color]
//
//    func body(content: Content) -> some View {
//        let gradient = LinearGradient(
//            gradient: Gradient(colors: gradientColors),
//            startPoint: .top,
//            endPoint: .init(x: 0.5, y: 1)
//        )
//
//        ZStack {
//            gradient
//                .frame(height: UIScreen.main.bounds.height / 6)
//                .cornerRadius(12)
//            content
//        }
//        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
//    }
//}
//

//struct CardModifierColour: ViewModifier {
//    var gradientColors: [Color]
//
//    func body(content: Content) -> some View {
//        let gradient = LinearGradient(
//            gradient: Gradient(colors: gradientColors),
//            startPoint: .top,
//            endPoint: .init(x: 0.5, y: 0.5)
//        )
//
//        ZStack {
//
//            gradient
//                .frame(height: UIScreen.main.bounds.height / 6)
//                .cornerRadius(12)
//                .fill(divider)
//
//            content
//                .cornerRadius(12)
//        }
//        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
//    }
//}
//
//


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
