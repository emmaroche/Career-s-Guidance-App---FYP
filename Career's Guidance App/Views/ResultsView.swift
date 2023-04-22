//
//  ResultsView.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 05/04/2023.
//

import SwiftUI

struct ResultsView: View {
    @Binding var result: Results
    @ObservedObject var viewCourseModel = CourseViewModel()
    @ObservedObject var viewModel = ResultViewModel()
    
    // Filters courses to only display with their matching categories
    var filteredCourses: [Courses] {
         viewCourseModel.courses.filter { course in
             course.course_details?.contains { details in
                 details.contains(result.Result!)
             } ?? false
         }
     }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            
            HStack(alignment: .center) {
                VStack(alignment: .leading , spacing: 25) {
                    HStack{
                        ZStack {
                            Text(result.Result!)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .lineLimit(nil)
                                .foregroundColor(CustomColour.customBlueColour2)
                        }
                    }
                    Text(result.ResultDescription!)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .padding(.bottom, 20)
                .padding(.top, 20)
                Spacer()
            }
            .padding(.bottom, 20)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.white)
            .modifier(CardModifier())
            .padding(.horizontal, 30)
            
            Text("Based on your results, the following courses have been recommended:")
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.black)
                .padding(.leading, 30)
                .padding(.trailing, 20)
            
            
                HStack(alignment: .center) {
                    VStack(alignment: .leading , spacing: 25) {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("Course recommendations")
                                        .font(.system(size: 20, weight: .bold, design: .default))
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .foregroundColor(CustomColour.customBlueColour2)
                                        .padding(.bottom, 20)
                                }
                                
                                // This function displays all courses relared to the result category while also hiding index 0 of the course_details array which is just used to link the category and course together. Code resourse used to help (modfied to fit this app) https://stackoverflow.com/questions/45933149/swift-how-to-get-indexes-of-filtered-items-of-array
                                
                                ForEach(filteredCourses, id: \.self) { course in
                                    ForEach(course.course_details?.enumerated().filter { $0.offset != 0 }.map { $0.element } ?? [], id: \.self) { name in
                                        Text(name)
                                            .font(.system(size: 16, weight: .medium, design: .default))
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .lineLimit(nil)
                                    }
                                }
                                .padding(.vertical, 5)

                            Spacer()
                        }
                        
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                    Spacer()
                }
                .padding(.bottom, -10)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)
                .modifier(CardModifier())
                .padding(.horizontal, 30)
            }
        }.onAppear() {
            viewCourseModel.getCourses(set: "set name here")
        }
    }
}


