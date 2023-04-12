//
//  ResultsDashboardView.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 06/04/2023.
//

import SwiftUI

import SwiftUICharts

struct ResultsDashboardView: View {
    @Binding var result: Results
    @State var isModal: Bool = false
    @State var data: [Double] = [0, 0, 0, 0, 0, 0]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 35) {
            
                                    
            HStack(alignment: .center) {
                VStack(alignment: .leading , spacing: 25) {
                    HStack {
                        ZStack {
                            
                            //https://developer.apple.com/documentation/foundation/dateformatter
                            
                            if let date = result.createDate {
                                
                                Text("Results from " + DateFormatter.localizedString(from: date,  dateStyle: .long, timeStyle: .none))
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .lineLimit(nil)
                            } else {
                                Text("No date")
                            }
 
                        }
                    }
                    
                    HStack {
                            Button(action: {
                                self.isModal = true
                                
                            }) {
                                Text("View Questionnaire results")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.trailing, 10)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Image(systemName: "arrowtriangle.forward.fill")
                                    .foregroundColor(CustomColour.customBlueColour)
                                
                            }.sheet(isPresented: $isModal, content: {
                                ResultsController(result: $result)
                            })
                        
                    }.padding(.horizontal, 40)
                    
                }
                Spacer()
            }
            .padding(.bottom, 50)
            .padding(.top, 30)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.white)
            .modifier(CardModifier())
            
        }
        
    }
    
}
    

