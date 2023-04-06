//
//  ResultDashboardController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 05/04/2023.
//

import SwiftUI
import UIKit
import Firebase

struct ResultsDashboardController: View {
    @ObservedObject var viewModel = ResultViewModel()
    @State var isModal: Bool = false
    
    var body: some View {
        
      
        ScrollView{
            
            VStack(alignment: .leading, spacing: 35) {
                Text("Results Dashboard")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Top Scoring Categories")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.trailing)
                
                
                VStack(alignment: .leading, spacing: 35)  {
                    ForEach(viewModel.results.indices, id: \.self) { index in
                        ResultsDashboardView(result: $viewModel.results[index])
                        
                    }
                }
                
                Text("Previous results")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.black)
                
                Spacer()
            }.padding(.leading, 30)
                .padding(.trailing, 30)
            
              
          .navigationBarTitle("Results")
            .onAppear() {
                viewModel.fetchResults()
            }
         
        }.clipped()
            .edgesIgnoringSafeArea(.top)
    
    }
            
    }
    


struct ResultsDashboardController_Previews: PreviewProvider {
    static var previews: some View {
        ResultsDashboardController()
    }
}

