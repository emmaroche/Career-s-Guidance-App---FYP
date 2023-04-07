//
//  CategoryViewModel.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 12/03/2023.
//

//import SwiftUI
//import Firebase
//import FirebaseFirestore
//
//class ResultViewModel: ObservableObject {
//
//    @Published var results: [Results] = []
//    var currentUser: String? = Auth.auth().currentUser?.uid
//
//    func fetchResults() {
//        let db = Firestore.firestore()
//
//        db.collection("Results")
//            .whereField("user", isEqualTo: currentUser!) // filter by current user's UID
//            .order(by: "createDate", descending: true)
//            .getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error getting results: \(error.localizedDescription)")
//                return
//            }
//
//            guard let documents = querySnapshot?.documents else {
//                print("No results found")
//                return
//            }
//
//            self.results = documents.compactMap { queryDocumentSnapshot in
//                try? queryDocumentSnapshot.data(as: Results.self)
//            }
//        }
//    }
//}

import SwiftUI
import Firebase
import FirebaseFirestore

class ResultViewModel: ObservableObject {

    @Published var results: [Results] = []
    var currentUser = Auth.auth().currentUser?.uid
    
    func fetchResults() {
        guard let currentUser = self.currentUser else {
            print("No current user")
            return
        }
        let db = Firestore.firestore()

        db.collection("Results")
            .whereField("user", isEqualTo: currentUser) // filter by current user's UID
            .order(by: "createDate", descending: true)
            .getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting results: \(error.localizedDescription)")
                return
            }

            guard let documents = querySnapshot?.documents else {
                print("No results found")
                return
            }

            self.results = documents.compactMap { queryDocumentSnapshot in
                try? queryDocumentSnapshot.data(as: Results.self)
            }
        }
    }
}
