//
//  QuizScreen.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 20/02/2023.
//

import SwiftUI
import CoreMIDI

struct QuizScreen: View {

    @State var show = false
    
    // Storing Level for Fetching Questions
    @State var set = "Questionnaire_1"
    
    @State var answered = 0
    
    @StateObject var data = ResultViewModel()
    @ObservedObject var viewCourseModel = CourseViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            
            Image("topScreenDesign")
                .resizable()
                .frame(width: 450, height: 200)
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
      
            VStack(alignment: .leading) {
                Text("Questionnaire")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                
                Text("This Course Matching Questionnaire is designed to help you discover courses \nthat are best suited to your skills and \ninterests!")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                    .padding(.trailing, 10)
                    .padding(.top, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("The results are aimed to show course \noptions you may not have considered \nbefore.")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                    .padding(.trailing, 10)
                    .padding(.top, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Please note that only one option is \naccepted per question so choose \nthe answer that relates to you the most.")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                    .padding(.trailing, 10)
                    .padding(.top, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("**NOTE:** There are no right or wrong answers.")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                    .padding(.trailing, 10)
                    .padding(.top, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 0)
            }.padding(.top, -70)
            
            VStack {
                // Level View
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 35) {
 
                    ForEach(1...1, id: \.self) { index in
                        VStack(spacing: 15) {
                            
                            Text("Get Started")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(CustomColour.customBlueColour)
                        }
                        .padding()
                        
                        .frame(width: 340, height: 55)
                        
                        .background(CustomColour.customGreenColour)
                        .cornerRadius(12)
                        // opens QA view as a sheet
                        .onTapGesture {
                            set = "Questionnaire_\(index)"
                            show.toggle()
                        }
                    }
                }
            }
            .padding(.top, 10)
            .padding(.leading, 136)
          
            Spacer(minLength: 0)
        }.padding(.bottom, 65)
        .background(Color.white.ignoresSafeArea())
        .sheet(isPresented: $show) {
            QA(answered: $answered, set: set, viewCourseModel: self.viewCourseModel)
        }
    }
}


struct QuizScreen2_Previews: PreviewProvider {
    static var previews: some View {
        QuizScreen()
    }
}
