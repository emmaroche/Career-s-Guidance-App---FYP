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
    @Binding var answered: Int
    
//    @State var categoryCount = [0,0,0,0,0,0]

    var set: String
    @StateObject var data = QuestionViewModel()
    
//    struct Category: Comparable {
//        var categoryName: String
//        var categoryCount: Int
//
//        static func < (lhs: Category, rhs: Category) -> Bool {
//            return lhs.categoryCount < rhs.categoryCount
//        }
//    }

    //Resource that helped display highest category (code in document is heavily modified and troubleshooted from these resources to suit whats needed for the CGA app): https://stackoverflow.com/questions/43806967/finding-indices-of-max-value-in-swift-array & https://stackoverflow.com/questions/69160416/how-do-i-get-the-variable-with-the-highest-int-and-retrieve-a-string-swift
    
    //Category array
    
    @State var categories: [Category] = [
        Category(categoryName: "Social", categoryCount: 0),
        Category(categoryName: "Artistic", categoryCount: 0),
        Category(categoryName: "Realistic", categoryCount: 0),
        Category(categoryName: "Conventional", categoryCount: 0),
        Category(categoryName: "Enterprising", categoryCount: 0),
        Category(categoryName: "Investigative", categoryCount: 0)
    ]
    
    @Environment(\.presentationMode) var present
    
    
    var body: some View {
        
            ZStack {
                if data.questions.isEmpty {
                    ProgressView()
                } else {
                    if answered == data.questions.count {
                        VStack(spacing: 25) {
                            
                            //get max number and count how many times in array.
                            
                            let highestIndex = categories.indices.max(by: { categories[$0].categoryCount < categories[$1].categoryCount })
                            let highestCategory = categories[highestIndex!]
                            
                            Text("Your highest category is: \(highestCategory.categoryName)")
                    
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
                                    QuestionView(question: $data.questions[index], correct: $correct, wrong: $wrong, answered: $answered, categories: $categories)
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
