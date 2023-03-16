//
//  QuizScreen.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 20/02/2023.
//

import SwiftUI

// Resource that helped me with importing custom app colours https://levelup.gitconnected.com/using-custom-colors-in-swiftui-d16f07d6a71e

struct CustomColour {
    static let customGreenColour = Color("customGreenColour")
    static let customBlueColour = Color("customBlueColour")
}

struct QuizScreen: View {
    
    
    @State var show = false
    // Storing Level for Fetching Questions
    @State var set = "Questionnaire_1"
    
    // for analytics
    @State var correct = 0
    @State var wrong = 0
    @State var answerd = 0
    
    
    var body: some View {
        VStack {
            
            Image("topScreenDesign")
                .resizable()
                .frame(width: 420, height: 200)
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
            Text("Questionnaire")
                .font(.system(size: 28))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding(.leading, 20)
                .padding(.top, -30)
            
            Text("This Course Matching Questionnaire is designed to help you discover courses that are best suited to your skills and interests.")
                .font(.system(size: 18))
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.top, 20)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("The results are aimed to show course options you may not have considered before!")
                .font(.system(size: 18))
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.leading, 20)
                .padding(.trailing, 10)
                .padding(.top, 20)
                .fixedSize(horizontal: false, vertical: true)

            
            Spacer(minLength: 0)
            
            // Level View
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35) {
                // four levels
                ForEach(1...1, id: \.self) { index in
                    VStack(spacing: 15) {
                        
                        Text("Get Started")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(CustomColour.customBlueColour)
                    }
                    .padding()
                    
                    .frame(width: 340, height: 55)

                    .background(CustomColour.customGreenColour)
                    .cornerRadius(12)
                    // opening QA view as sheet
                    .onTapGesture {
                        set = "Questionnaire_\(index)"
                        show.toggle()
                    }
                }
            }
            
            .padding(.leading, 136)
            
            Spacer(minLength: 0)
        }
        .background(Color.black.opacity(0.05).ignoresSafeArea())
        .sheet(isPresented: $show) {
            QA(correct: $correct, wrong: $wrong, answered: $answerd, set: set)
        }
    }
}

struct QuizScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuizScreen()
    }
}
