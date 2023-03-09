//
//  Questionnaire.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 22/02/2023.
//

import SwiftUI

// MARK: Quiz info

import SwiftUI
import FirebaseFirestoreSwift

struct Question: Identifiable, Codable {
    // it will fetch doc ID
    @DocumentID var id: String?
    var question: String?
    var question_number: String?
    var option1: String?
    var option2: String?
    var option3: String?
    var option4: String?
    var option5: String?
    var option6: String?
    var answer: String?
//    var choices: [String]?
    
    // for checking
    var isSubmitted = false
    var completed = false
    
    // declare the coding keys with respect to Firebase Firestore Key
    enum CodingKeys: String, CodingKey {
        case question
        case question_number
        case option1 = "a"
        case option2 = "b"
        case option3 = "c"
        case option4 = "d"
        case option5 = "e"
        case option6 = "f"
        case answer
//        case choices
    }
}
