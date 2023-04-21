//
//  GuestResultsDashboard.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 21/04/2023.
//

import SwiftUI
import Firebase

struct GuestResultsDashboard: View {
    @ObservedObject var viewModel = ResultViewModel()
    @ObservedObject var viewCourseModel = CourseViewModel()
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 35) {
                
                    Text("Results Dashboard")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding(.leading, 30)


                Text("Previous Result")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .multilineTextAlignment(.trailing)
                    .padding(.leading, 30)
                
                // Code resource to help me bind the specific result clicked to the ResultsView  https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-constant-bindings
                GuestResultsView(viewCourseModel: self.viewCourseModel)
                
            }
            .padding(.top, 50)
            .navigationBarTitle("Results")
            .onAppear() {
                viewModel.fetchResults()
            }
           
        }
    }
    
}

