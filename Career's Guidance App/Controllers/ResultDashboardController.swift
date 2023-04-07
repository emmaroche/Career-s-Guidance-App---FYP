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
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .fontWeight(.bold)
                Text("Top Scoring Categories")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.trailing)
                
                Text("Previous results")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 35)  {
                    ForEach(viewModel.results.indices, id: \.self) { index in
                        ResultsDashboardView(result: $viewModel.results[index])
                        
                    }
                }
            
                
                Spacer()
            }.padding(.leading, 30)
                .padding(.trailing, 30)
            
              
          .navigationBarTitle("Results")
            .onAppear() {
                viewModel.fetchResults()
            }
         
        }.clipped()
           
    
    }
            
    }
    


struct ResultsDashboardController_Previews: PreviewProvider {
    static var previews: some View {
        ResultsDashboardController()
    }
}

