//
//  Courses.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 13/04/2023.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Courses: Identifiable, Codable, Hashable {
    // fetch doc ID
    @DocumentID var id: String?

var name: String?

    
    enum CodingKeys: String, CodingKey {
        case name

    }

}

