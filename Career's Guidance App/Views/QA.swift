//
//  QA.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 02/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseCore

// Resource that helped with displaying questions: https://www.youtube.com/watch?v=S_BwMu2J3TQ (the code I have implemented has been modified significantly to fit the content of the CGA and this tutorial was used only as a guide to link this questionnaire with Firebase)

struct QA: View {
    
    @Binding var answered: Int    
    var set: String
    @StateObject var data = QuestionViewModel()
    @StateObject var viewCourseModel = CourseViewModel()
    @StateObject var viewModel = ResultViewModel()

    // Resource that helped display highest category (code I have implemeted has been heavily modified and troubleshooted from these resources to suit whats needed for the CGA app): https://stackoverflow.com/questions/43806967/finding-indices-of-max-value-in-swift-array & https://stackoverflow.com/questions/69160416/how-do-i-get-the-variable-with-the-highest-int-and-retrieve-a-string-swift
    
    @State var ResultTitle = ""
    @State var ResultDescription = ""
    @State var ResultDate = ""
    @State var createDate = ""
    @State var user = ""
    
    //Category array
    @State var categories: [Category] = [
        Category(categoryName: "Realistic", categoryDescription: "You like working mainly with your hands making, fixing, assembling or building things, using and operating equipment, tools or machines.", categoryCount: 0),
        Category(categoryName: "Investigative", categoryDescription: "You like to discover and research ideas, observe, investigate and experiment, ask questions and solve questions.", categoryCount: 0),
        Category(categoryName: "Social", categoryDescription: "You like working with people to teach, train, inform, help, treat, heal, cure, serve and greet.", categoryCount: 0),
        Category(categoryName: "Artistic", categoryDescription: "You like using words, art, music or drama to express yourself, communicate or perform or you like to create or design things.", categoryCount: 0),
        Category(categoryName: "Enterprising", categoryDescription: "You like meeting people, leading, talking to and influencing others, encouraging others, working in business.", categoryCount: 0),
        Category(categoryName: "Conventional", categoryDescription: "You like working indoors and at tasks that involve organising and being accurate, following procedures, working with data or numbers, planning work and events.", categoryCount: 0)
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
                            
                            Text("Results")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 30)
                                .padding(.top, 30)
                            
                            Text("Top Category")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.trailing)
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

                            
                            // Adds a reposnse date to the result
                            let date: Date = Date()
                            
                            // Links result to current user
                            let userID = Auth.auth().currentUser!.uid
                            
                            HStack(alignment: .center) {
                                
                                VStack(alignment: .leading , spacing: 25) {
                                    
                                    HStack{
                                        
                                        ZStack {
                                            
                                            
                                            Text(" \(highestCategory.categoryName)")
                                                .font(.system(size: 20, weight: .bold, design: .default))
                                                .frame(maxWidth: .infinity, alignment: .center)
                                            
                                        }
                                        
                                    }
                                    
                                    Text("\(highestCategory.categoryDescription)")
                                        .font(.system(size: 16, weight: .regular, design: .default))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    
                                }.padding(.leading, 30)
                                    .padding(.trailing, 30)
                                    .padding(.bottom, 20)
                                    .padding(.top, 20)
                                
                                Spacer()
                            }    .padding(.bottom, 50)
                                .padding(.top, 30)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.white)
                                .modifier(CardModifier())
                                .padding(.all, 30)
                            
                            Text("Based on your results, the following courses have been recommended:")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                            
                            HStack(alignment: .center){
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
                            }.onAppear() {
                                viewCourseModel.getCourses(set: "set name here")
                            }
                            
                            Button(action: {
                                // Closes the sheet
                                present.wrappedValue.dismiss()
                                answered = 0
                                
                                self.AddInfo(Result: highestCategory.categoryName, ResultDescription: highestCategory.categoryDescription, createDate: date, user: userID)
                                
                                
                                
                            }) {
                                Text("Save")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 50)
                                    .background(CustomColour.customBlueColour2)
                                    .cornerRadius(15)
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
    
    // Add result info to firebase
    func AddInfo(Result: String, ResultDescription: String, createDate: Date, user: String){
        let db = Firestore.firestore()
        db.collection("Results").document().setData(["Result": Result, "ResultDescription": ResultDescription,"createDate": createDate, "user": user])
    }
    
    // progress
    func progress() -> CGFloat {
        let fraction = CGFloat(answered) / CGFloat(data.questions.count)
        
        let width = UIScreen.main.bounds.width - 30
        
        return fraction * width
    }
}
