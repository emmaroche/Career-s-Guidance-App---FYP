//
//  QuestionsVIew.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 02/03/2023.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: Question
    @Binding var answered: Int
    
    // var shuffle: true if shuffle...... set it to false after for
    
    // Calling Category array from QA
    @Binding var categories: [Category]

    @State var selected = ""
    @State var selectedAnswer = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 22) {
            HStack(spacing: 15){
            Text(question.question!)
                .font(.system(size: 18, weight: .semibold, design: .default))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.top, 25)
            
            Spacer(minLength: 0)
            
            }
    
                ForEach(question.answer_choices!, id: \.self) { answerChoice in

                    Button(action: {
                        selected = answerChoice
                        question.answer = answerChoice
                        selectedAnswer = true
                    }) {
                        Text(answerChoice)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(color(option: answerChoice), lineWidth: 2)
                            )
                    }

                }
//                
//                .onAppear {
//                    question.answer_choices?.shuffle()
//
//                }
//
//            // Create a new shuffled array for display
//            let shuffledAnswerChoices = question.answer_choices?.shuffled()
//
//            // Use the shuffled array for display
//            ForEach(shuffledAnswerChoices!, id: \.self) { answerChoice in
//                Button(action: {
//                    selected = answerChoice
//                    question.answer = answerChoice
//                }) {
//                    Text(answerChoice)
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .stroke(color(option: answerChoice), lineWidth: 2)
//                        )
//                } .id(answerChoice)
//                .animation(nil, value: answerChoice)
//                .transition(.identity)
//            }.onAppear {
//                                    question.answer_choices?.shuffle()
//
//                                }
//
//

            //Flag - first display = false ..... or count

//                Spacer(minLength: 0)

            // Next Button
            HStack(spacing: 15) {
                Button(action: {
                    withAnimation {
                        question.completed.toggle()
                        answered += 1
                        countAns()
                    }
                }) {
                    Text("Next")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(CustomColour.customBlueColour2)
                        .cornerRadius(12)
                }
                .disabled(!selectedAnswer)
                .opacity(!selectedAnswer ? 0.7 : 1)
            }
            .padding(.bottom)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.02), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.02), radius: 5, x: -5, y: -5)
    }
    
    // highlighting Answer
    func color(option: String) -> Color {
        if option == selected {
                return (CustomColour.customGreenColour)
            
        } else {
            
            return Color.gray
        }
    }

     func countAns() {
        if selected == question.answer_choices![0] {
            //social
            categories[0].categoryCount += 1
        }
        
        if selected == question.answer_choices![1] {
            //artistic
            categories[1].categoryCount += 1
        }
        
        if selected == question.answer_choices![2] {
            //realistic
            categories[2].categoryCount += 1
        }
        
        if selected == question.answer_choices![3] {
           //conventional
            categories[3].categoryCount += 1
        }
        
        if selected == question.answer_choices![4] {
           //enterprising
            categories[4].categoryCount += 1
        }
        
        if selected == question.answer_choices![5] {
           //investigative
            categories[5].categoryCount += 1
        }
        
        question.isSubmitted.toggle()
    }

}



