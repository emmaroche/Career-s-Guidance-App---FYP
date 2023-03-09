//
//  QuestionViewModel.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 02/03/2023.
//

import SwiftUI

import SwiftUI
import Firebase
import FirebaseFirestore

class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = []
    
    func getQuestions(set: String) {
        // since we are having only one set in Firestore, so we are going to fetch that one only
        // you can add round 2, 3, etc.. into Firestore and can be fetched
        let db = Firestore.firestore()
        
        // change this to set
        db.collection("Questionnaire_1").getDocuments { (snapshot, err) in
            
            guard let data = snapshot else { return }
            
            DispatchQueue.main.async {
                self.questions = data.documents.compactMap({ (doc) -> Question? in
                    return try? doc.data(as: Question.self)
                })
                print(self.questions)
            }
            
        }
    }
}
