//
//  Results.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 04/04/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Results: Identifiable, Codable {
    // fetch doc ID
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


