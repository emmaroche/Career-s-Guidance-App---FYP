//
//  Questionnaire.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 22/02/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Question: Identifiable, Codable {
    // fetch doc ID
    @DocumentID var id: String?
    var question: String?
    var question_number: String?
    var answer: String?
    var answer_choices: [String]?

    // for checking
    var isSubmitted = false
    var completed = false
    
    // declare the coding keys with respect to Firebase Firestore Key
    enum CodingKeys: String, CodingKey {
        case question
        case question_number
        case answer
        case answer_choices
    }
}
