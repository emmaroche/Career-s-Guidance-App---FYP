//
//  Results.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 04/04/2023.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Results: Identifiable, Codable {
    // fetch doc ID
    
//    init?(document: QueryDocumentSnapshot) {
//        guard let data = Optional(document.data()),
//              let createDate = data["createDate"] as? Timestamp
//        else {
//            return nil
//        }
//
//        self.id = document.documentID
//        self.Result = data["Result"] as? String
//        self.ResultDescription = data["ResultDescription"] as? String
//        self.createDate = createDate.dateValue()
//    }

    
    @DocumentID var id: String?

    var Result: String?
    var ResultDescription:  String?
    var createDate: Date?

    // declare the coding keys with respect to Firebase Firestore Key
    enum CodingKeys: String, CodingKey {
        case Result
        case ResultDescription
        case createDate
    }

}

