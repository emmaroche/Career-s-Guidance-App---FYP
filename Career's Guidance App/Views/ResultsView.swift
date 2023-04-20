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
                        }
                    }
                    Text(result.ResultDescription!)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                Spacer()
            }
            .padding(.bottom, 50)
            .padding(.top, 30)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.white)
            .modifier(CardModifier())
            .padding(.all, 30)
            
            Text("Based on your results, the following courses have been recommended:")
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.black)
                .padding(.leading, 30)
                .padding(.trailing, 20)
            
            
                HStack(alignment: .center) {
                    VStack(alignment: .leading , spacing: 25) {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading , spacing: 25) {
                                HStack{
                                    Text("Course recommendations")
                                        .font(.system(size: 20, weight: .bold, design: .default))
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                
                                ForEach(filteredCourses, id: \.self) { course in
                                    ForEach(course.course_details ?? [], id: \.self) { name in
                                        Text(name)
                                            .font(.system(size: 17, weight: .regular, design: .default))
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .lineLimit(nil)
                                    }
                                } .padding(.leading, 30)
                                .padding(.trailing, 30)
                                .padding(.bottom, 20)
                                .padding(.top, 20)
                            Spacer()
                        }
                        
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                    Spacer()
                }
                .padding(.bottom, 50)
                .padding(.top, 30)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)
                .modifier(CardModifier())
                .padding(.all, 30)
            }
        }.onAppear() {
            viewCourseModel.getCourses(set: "set name here")
        }
    }
}

//                            HStack(alignment: .center) {
//                                VStack(alignment: .leading , spacing: 25) {
//                                    HStack{
//                                        Text("Course recommendations")
//                                            .font(.system(size: 20, weight: .bold, design: .default))
//                                            .frame(maxWidth: .infinity, alignment: .center)
//                                    }
//
//
//                                    Text("Course")
//                                        .font(.system(size: 17, weight: .regular, design: .default))
//                                        .foregroundColor(.black)
//                                        .frame(maxWidth: .infinity, alignment: .center)
//                                        .fixedSize(horizontal: false, vertical: true)
//                                        .lineLimit(nil)
//                                } .padding(.leading, 30)
//                                    .padding(.trailing, 30)
//                                    .padding(.bottom, 20)
//                                    .padding(.top, 20)
//                                Spacer()
//                            }
//                            .padding(.bottom, 50)
//                            .padding(.top, 30)
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .background(Color.white)
//                            .modifier(CardModifier())
//                            .padding(.all, 30)
//
//
//        }
//
//    }
//
//}

