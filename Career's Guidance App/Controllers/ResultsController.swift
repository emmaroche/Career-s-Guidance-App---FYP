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
    @Binding var result: Results
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 35) {
                Text("Results")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                Text("Top Category")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.trailing)
                    .padding(.leading, 20)
                
                // Code resource to help me bind the specific result clicked to the ResultsView  https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-constant-bindings
                      ResultsView(result: .constant(result))
                
            } .padding(.top, 50)
            .navigationBarTitle("Results")
            .onAppear() {
                viewModel.fetchResults()
            }
        }
    }
    
}

