//
//  ResultsController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 06/04/2023.
//

import SwiftUI
import Firebase

struct ResultsController: View {
    @ObservedObject var viewModel = ResultViewModel()
    @ObservedObject var viewCourseModel = CourseViewModel()
    @Binding var result: Results
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 35) {
                HStack{
                    Text("Results")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding(.leading, 30)
                    
                    Spacer()
                    Button(action: {
                        withAnimation(.easeOut) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        }) {
                          Image(systemName: "xmark.circle.fill")
                                .foregroundColor(CustomColour.customBlueColour)
                                .padding(.trailing, 30)
                        }
                }
                Text("Top Category")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .multilineTextAlignment(.trailing)
                    .padding(.leading, 30)
                
                // Code resource to help me bind the specific result clicked to the ResultsView  https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-constant-bindings
                ResultsView(result: .constant(result), viewCourseModel: self.viewCourseModel)
                
            }
            .padding(.top, 50)
            .navigationBarTitle("Results")
            .onAppear() {
                viewModel.fetchResults()
            }
           
        }
    }
    
}

