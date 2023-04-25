//
//  CourseViewModel.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 13/04/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class CourseViewModel: ObservableObject {
    
    @Published var courses: [Courses] = []
    
    func getCourses(set: String) {
        
        let db = Firestore.firestore()
        
        db.collection("Courses").getDocuments { (snapshot, err) in
            
            guard let data = snapshot else { return }
            
            DispatchQueue.main.async {
                self.courses = data.documents.compactMap({ (doc) -> Courses? in
                    return try? doc.data(as: Courses.self)
                })
                print(self.courses)
            }
            
        }
    }
    
}

