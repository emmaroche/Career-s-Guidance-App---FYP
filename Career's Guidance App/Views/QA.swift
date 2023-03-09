//
//  QA.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 02/03/2023.
//

import SwiftUI

struct QA: View {
    @Binding var correct: Int
    @Binding var wrong: Int
    @Binding var social: Int
    @Binding var creative: Int
    @Binding var answered: Int
    var set: String
    @StateObject var data = QuestionViewModel()
    
    @Environment(\.presentationMode) var present
    
    var body: some View {
        //        ZStack {
        //            if data.questions.isEmpty {
        //                ProgressView()
        //            } else {
        //                if answered == data.questions.count {
        //                    VStack(spacing: 25) {
        //
        //                        Text("Well Done!")
        //                            .font(.title)
        //                            .fontWeight(.heavy)
        //                            .foregroundColor(.black)
        //
        //                        // Score and Back to Home Button
        //                        HStack(spacing: 15) {
        //                            Image(systemName: "checkmark")
        //                                .font(.largeTitle)
        //                                .foregroundColor(.green)
        //
        //                            Text("\(correct)")
        //                                .font(.largeTitle)
        //                                .foregroundColor(.black)
        //
        //                            Image(systemName: "xmark")
        //                                .font(.largeTitle)
        //                                .foregroundColor(.red)
        //                                .padding(.leading)
        //
        //                            Text("\(wrong)")
        //                                .font(.largeTitle)
        //                                .foregroundColor(.black)
        //                        }
        //
        //                        HStack(spacing: 15) {
        //                            Image(systemName: "checkmark")
        //                                .font(.largeTitle)
        //                                .foregroundColor(.green)
        //
        //                            Text("\(social)")
        //                                .font(.largeTitle)
        //                                .foregroundColor(.black)
        //
        //                            Image(systemName: "xmark")
        //                                .font(.largeTitle)
        //                                .foregroundColor(.red)
        //                                .padding(.leading)
        //
        //                            Text("\(creative)")
        //                                .font(.largeTitle)
        //                                .foregroundColor(.black)
        //                        }
        //
        //                        Button(action: {
        //                            // closing sheet
        //                            present.wrappedValue.dismiss()
        //                            answered = 0
        //                            correct = 0
        //                            wrong = 0
        //                        }) {
        //                            Text("Go to Home")
        //                                .fontWeight(.heavy)
        //                                .foregroundColor(.white)
        //                                .padding(.vertical)
        //                                .frame(width: UIScreen.main.bounds.width - 150)
        //                                .background(Color.blue)
        //                                .cornerRadius(15)
        //                        }
        //                    }
        //                } else {
        //                    VStack {
        //                        // Top Progress View
        //                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
        //                            Capsule()
        //                                .fill(Color.gray.opacity(0.5))
        //                                .frame(height: 6)
        //
        //                            Capsule()
        //                                .fill(Color.green)
        //                                .frame(width: progress(), height: 6)
        //                        }
        //                        .padding()
        //
        //
        //                            // QuestionView
        //                        ZStack {
        //                            ForEach(data.questions.reversed().indices, id: \.self) { index in
        //                                // View
        //                                QuestionView(question: $data.questions[index], correct: $correct, wrong: $wrong, answered: $answered, social: $social, creative: $creative)
        //                                    .offset(x: data.questions[index].completed ? 1000 : 0)
        //                                    .rotationEffect(Angle(degrees: data.questions[index].completed  ? 10 : 0))
        //                            }
        //                        }
        //                        .padding()
        //                    }
        //                }
        //            }
        //        }
        //        // fetching
        //        .onAppear {
        //            data.getQuestions(set: set)
        //        }
        //    }
        
            ZStack {
                if data.questions.isEmpty {
                    ProgressView()
                } else {
                    if answered == data.questions.count && social >= 2 {
                        VStack(spacing: 25) {
                            
                            Text("YOU ARE VERY SOCIAL!")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            
                            Button(action: {
                                // closing sheet
                                present.wrappedValue.dismiss()
                                answered = 0
                                correct = 0
                                wrong = 0
                            }) {
                                Text("Go to Home")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 150)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                            }
                        }
                    }; if answered == data.questions.count && creative >= 2 {
                        VStack(spacing: 25) {
                            
                            Text("YOU ARE VERY CREATIVE!")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            
                            Button(action: {
                                // closing sheet
                                present.wrappedValue.dismiss()
                                answered = 0
                                correct = 0
                                wrong = 0
                            }) {
                                Text("Go to Home")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 150)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                            }
                        }
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
                                    QuestionView(question: $data.questions[index], correct: $correct, wrong: $wrong, answered: $answered, social: $social, creative: $creative)
                                        .offset(x: data.questions[index].completed ? 1000 : 0)
                                        .rotationEffect(Angle(degrees: data.questions[index].completed  ? 10 : 0))
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            // fetching
            .onAppear {
                data.getQuestions(set: set)
            }
        }
    
    
    // progress
    func progress() -> CGFloat {
        let fraction = CGFloat(answered) / CGFloat(data.questions.count)
        
        let width = UIScreen.main.bounds.width - 30
        
        return fraction * width
    }
}
