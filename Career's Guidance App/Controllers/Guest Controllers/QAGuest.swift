//
//  QAGuest.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 21/04/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseCore

// Resource that helped with displaying questions: https://www.youtube.com/watch?v=S_BwMu2J3TQ (the code I have implemented has been modified significantly to fit the content of the CGA and this tutorial was used only as a guide to link this questionnaire with Firebase)

struct QAGuest: View {
    
    @Binding var answered: Int
    var set: String
    @StateObject var data = QuestionViewModel()
    @StateObject var viewCourseModel = CourseViewModel()
    @StateObject var viewModel = ResultViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    // Resource that helped display highest category (code I have implemeted has been heavily modified and troubleshooted from these resources to suit whats needed for the CGA app): https://stackoverflow.com/questions/43806967/finding-indices-of-max-value-in-swift-array & https://stackoverflow.com/questions/69160416/how-do-i-get-the-variable-with-the-highest-int-and-retrieve-a-string-swift
    
    @State var ResultTitle = ""
    @State var ResultDescription = ""
    @State var ResultDate = ""
    @State var createDate = ""
    @State var user = ""
    
    //Category array
    @State var categories: [Category] = [
        Category(categoryName: "Realistic", categoryDescription: "Realistic individuals are practical and hands-on, preferring to work with things rather than people or ideas. \n\nThey enjoy physical activity, often outdoors, and working with plants and animals. They learn by doing and value material things, communicating in a frank, direct manner.", categoryCount: 0),
        Category(categoryName: "Investigative", categoryDescription: "Investigative individuals are analytical and observant, excelling in complex problem-solving related to research, math, and science. \n\nThey work autonomously and value science and learning, preferring an environment that encourages scientific competencies and independent work.", categoryCount: 0),
        Category(categoryName: "Social", categoryDescription: "Social individuals are humanistic and responsible, helping and developing others through teamwork. \n\nThey excel in interpersonal problem-solving and value significant interaction with others in a warm and tactful manner.", categoryCount: 0),
        Category(categoryName: "Artistic", categoryDescription: "Artistic individuals are imaginative and seek self-expression through creative activities. They prefer flexibility and value aesthetics, avoiding conformity. \n\nThe preferred work environment encourages creativity and imagination in an unstructured setting.", categoryCount: 0),
        Category(categoryName: "Enterprising", categoryDescription: "Enterprising individuals are energetic, ambitious, and self-confident, seeking leadership roles and enjoying sales and persuasion. \n\nThey excel in leadership and persuasive abilities and thrive in an environment that rewards them through power, status, and money.", categoryCount: 0),
        Category(categoryName: "Conventional", categoryDescription: "Conventional individuals are efficient, organized, and conscientious, thriving in a well-defined chain of command. \n\nThey prefer systematic activities and are skilled in maintaining and manipulating data. While they may lack creativity, they are reliable and thorough in carrying out tasks.", categoryCount: 0)
    ]
    
    

    @Environment(\.presentationMode) var present
    
    var body: some View {
        
        ScrollView {
            ZStack {
                if data.questions.isEmpty {
                    ProgressView()
                } else {
                    if answered == data.questions.count {
                        VStack(alignment: .leading, spacing: 35){
                            
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
                            } .padding(.top, 50)
                            
                            Text("Top Category")
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .multilineTextAlignment(.trailing)
                                .lineLimit(nil)
                                .padding(.leading, 30)
                            
                            // Gets max number and counts how many times in array
                            let highestIndex = categories.indices.max(by: { categories[$0].categoryCount < categories[$1].categoryCount })
                            let highestCategory = categories[highestIndex!]
                            
                            // Filters courses to make sure that only the courses related to the highest category are being displayed
                            var filteredCourses: [Courses] {
                                viewCourseModel.courses.filter { course in
                                    course.course_details?.contains { details in
                                        details.contains(highestCategory.categoryName)
                                    } ?? false
                                }
                            }
                            
                            
                            HStack(alignment: .center) {
                                
                                VStack(alignment: .leading , spacing: 25) {
                                    
                                    HStack{
                                        
                                        ZStack {
                                            if highestCategory.categoryName == "Conventional"{
                                                Text(" \(highestCategory.categoryName)")
                                                .font(.system(size: 20, weight: .bold, design: .default))
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .lineLimit(nil)
                                                .foregroundColor(CustomColour.customPurpleColour)
                                            }
                                            
                                            if highestCategory.categoryName == "Social"{
                                                Text(" \(highestCategory.categoryName)")
                                                .font(.system(size: 20, weight: .bold, design: .default))
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .lineLimit(nil)
                                                .foregroundColor(CustomColour.customLightBlueColour)
                                 
                                            }
                                            
                                            if highestCategory.categoryName == "Investigative"{
                                                Text(" \(highestCategory.categoryName)")
                                                .font(.system(size: 20, weight: .bold, design: .default))
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .lineLimit(nil)
                                                .foregroundColor(CustomColour.customOrangeColour)
                                            }
                                            
                                            if highestCategory.categoryName == "Enterprising"{
                                                Text(" \(highestCategory.categoryName)")
                                                .font(.system(size: 20, weight: .bold, design: .default))
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .lineLimit(nil)
                                                .foregroundColor(CustomColour.customGreenColour)
                                            }
                                            
                                            if highestCategory.categoryName == "Artistic"{
                                                Text(" \(highestCategory.categoryName)")
                                                .font(.system(size: 20, weight: .bold, design: .default))
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .lineLimit(nil)
                                                .foregroundColor(CustomColour.customPinkColour2)
                                            }
                                            
                                            if highestCategory.categoryName == "Realistic"{
                                                Text(" \(highestCategory.categoryName)")
                                                .font(.system(size: 20, weight: .bold, design: .default))
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .lineLimit(nil)
                                                .foregroundColor(CustomColour.customPinkColour)
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                    Text("\(highestCategory.categoryDescription)")
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
                            }    .padding(.bottom, 20)
                                .padding(.top, 20)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.white)
                                .modifier(CardModifier())
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                            
                            Text("Based on your results, the following courses have been recommended:")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .foregroundColor(.black)
                                .padding(.leading, 30)
                                .padding(.trailing, 20)
                            
                            HStack(alignment: .center){
                                VStack(alignment: .leading , spacing: 25) {
                                    HStack(alignment: .center) {
                                        VStack(alignment: .leading , spacing: 25) {
                                            HStack{
                                                Text("Course recommendations")
                                                    .font(.system(size: 20, weight: .bold, design: .default))
                                                    .frame(maxWidth: .infinity, alignment: .center)
                                                    .foregroundColor(CustomColour.customBlueColour2)
                                                    .padding(.bottom, 20)
                                            }
                                            
                                            
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
                            }.onAppear() {
                                viewCourseModel.getCourses(set: "set name here")
                            }
                            
                            Button(action: {
                                present.wrappedValue.dismiss()
                                answered = 0

                            }) {
                                Text("Close")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 50)
                                    .background(CustomColour.customBlueColour2)
                                    .cornerRadius(12)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        
                    }
                    
                    else {
                        VStack {
                            // Top Progress View
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                                Capsule()
                                    .fill(Color.gray.opacity(0.5))
                                    .frame(height: 6)
                                
                                Capsule()
                                    .fill(Color.green)
                                    .frame(width: progress(), height: 6)
                            }
                            .padding()
                            
                            // QuestionView
                            ZStack {
                                ForEach(data.questions.reversed().indices, id: \.self) { index in
                                    // View
                                    QuestionView(question: $data.questions[index], answered: $answered, categories: $categories)
                                        .offset(x: data.questions[index].completed ? 1000 : 0)
                                        .rotationEffect(Angle(degrees: data.questions[index].completed  ? 10 : 0))
                                }
                            }
                            .padding(.all, 30)
                        }
                    }
                }
            }
            // fetching
            .onAppear {
                data.getQuestions(set: set)
                viewCourseModel.getCourses(set: "set name here")
            }
            
        }
    }
    
    // Progress bar
    func progress() -> CGFloat {
        let fraction = CGFloat(answered) / CGFloat(data.questions.count)
        
        let width = UIScreen.main.bounds.width - 30
        
        return fraction * width
    }
}
