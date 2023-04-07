//
//  QuestionViewModel.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 02/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = []
    
    func getQuestions(set: String) {

        let db = Firestore.firestore()
        
        db.collection("Questionnaire_1").getDocuments { (snapshot, err) in
            
            guard let data = snapshot else { return }
            
            DispatchQueue.main.async {
                self.questions = data.documents.compactMap({ (doc) -> Question? in
                    return try? doc.data(as: Question.self)
                }).shuffled() //https://developer.apple.com/documentation/swift/array/shuffled()
                print(self.questions)
            }
            
        }
    }
    
}

