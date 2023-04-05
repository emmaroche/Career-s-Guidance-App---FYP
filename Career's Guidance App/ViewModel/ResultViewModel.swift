//
//  CategoryViewModel.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 12/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore


class ResultViewModel: ObservableObject {

    @Published var results: [Results] = []

    func getResults(set: String) {

        let db = Firestore.firestore()

        db.collection("Results").getDocuments { (snapshot, err) in

            guard let data = snapshot else { return }

            DispatchQueue.main.async {
                self.results = data.documents.compactMap({ (doc) -> Results? in
                    return try? doc.data(as: Results.self)
                })
                print(self.results)
            }

        }
    }
}
