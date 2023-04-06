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
//
//    func getResults() {
//        let db = Firestore.firestore()
//
//        db.collection("Results").getDocuments { (querySnapshot, error) in
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
//
//
//}
//

import SwiftUI
import Firebase
import FirebaseFirestore


class ResultViewModel: ObservableObject {

    @Published var results: [Results] = []

    func fetchResults() {
        let date = Date(timeIntervalSinceNow: -24*60*60) // get date of 24 hours ago
        let db = Firestore.firestore()

        db.collection("Results")
            .whereField("createDate", isGreaterThan: date)
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
