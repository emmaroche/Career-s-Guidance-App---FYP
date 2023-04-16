//
//  QuizScreen.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 20/02/2023.
//

import SwiftUI
import CoreMIDI

// Resource that helped me with importing custom app colours https://levelup.gitconnected.com/using-custom-colors-in-swiftui-d16f07d6a71e

//struct CustomColour {
//    static let customGreenColour = Color("customGreenColour")
//    static let customBlueColour = Color("customBlueColour")
//}

struct QuizScreen: View {
    
    @State var show = false
    
    // Storing Level for Fetching Questions
    @State var set = "Questionnaire_1"
    
    // for analytics
    @State var answered = 0
    
    @StateObject var data = ResultViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            
            Image("topScreenDesign")
                .resizable()
                .frame(width: 420, height: 200)
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
      
            VStack(alignment: .leading) {
                Text("Questionnaire")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                
                Text("This Course Matching Questionnaire is designed to help you discover courses \nthat are best suited to your skills and \ninterests.")
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                    .padding(.trailing, 10)
                    .padding(.top, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("The results are aimed to show course \noptions you may not have considered \nbefore!")
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                    .padding(.trailing, 10)
                    .padding(.top, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("**NOTE:** There is no right or wrong answers")
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                    .padding(.trailing, 10)
                    .padding(.top, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 0)
            }.padding(.top,-50)
            
            VStack {
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
            }
            .padding(.top, 100)
            .padding(.leading, 136)
          
            
            Spacer(minLength: 0)
        }.padding(.bottom, 65)
        .background(Color.black.opacity(0.05).ignoresSafeArea())
        .sheet(isPresented: $show) {
            QA(answered: $answered, set: set)
        }
    }
}

struct QuizScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuizScreen()
    }
}
