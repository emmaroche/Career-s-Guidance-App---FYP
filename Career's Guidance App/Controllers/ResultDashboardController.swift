//
//  ResultDashboardController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 05/04/2023.
//

import SwiftUI
import UIKit
import Firebase
import SwiftPieChart

struct ResultsDashboardController: View {
    @ObservedObject var viewModel = ResultViewModel()
    @ObservedObject var viewCourseModel = CourseViewModel()

    @State var isModal: Bool = false
    
    var body: some View {
        
        ScrollView{
            if viewModel.results.isEmpty{
                VStack(alignment: .leading, spacing: 35) {
                    Text("Results Dashboard")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .fontWeight(.bold)
                    
                    Text("There are currently no results to display.")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .fontWeight(.semibold)
                    
                    Text("Complete the Course Matching \nQuestionnaire available in the 'Quiz' \nsection and save your results to \nview them here.")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .fontWeight(.semibold)

                }.padding(.leading, 30)
                    .padding(.trailing, 30)
            } else {
                
                VStack(alignment: .leading, spacing: 35) {
                Text("Results Dashboard")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .fontWeight(.bold)
                
                Text("Top Scoring Categories")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.trailing)
                
                VStack(alignment: .center, spacing: 35) {
 
                    PieChart(data: $viewModel.data, labels: ["Realistic","Investigative", "Social", "Artistic", "Enterprising", "Conventional"], colors: [CustomColour.customPinkColour, CustomColour.customOrangeColour, CustomColour.customLightBlueColour, CustomColour.customPinkColour2, CustomColour.customGreenColour, CustomColour.customPurpleColour], borderColor: Color.clear).frame(height: 225)
                    
                }.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
                

                Text("Previous questionnaire results")
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
            
            
                .navigationBarTitle("Results")}

            
        }.clipped()
        
            .onAppear() {
                viewModel.fetchResults()
                viewModel.countRes()
            }            .background(Color.clear)
    }
    
}


