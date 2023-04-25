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
    
    @DocumentID var id: String?

    var Result: String?
    var ResultDescription:  String?
    var createDate: Date?

    enum CodingKeys: String, CodingKey {
        case Result
        case ResultDescription
        case createDate
    }
}

