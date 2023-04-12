//
//  ResultViewModel.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 12/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class ResultViewModel: ObservableObject {
    
    @Published var results: [Results] = []
    @Published var data: [Double] = [0, 0, 0, 0, 0, 0]
    
    
    var currentUser = Auth.auth().currentUser?.uid
    
    func fetchResults() {
        guard let currentUser = self.currentUser else {
            print("No current user")
            return
        }
        let db = Firestore.firestore()
        
        db.collection("Results")
            .whereField("user", isEqualTo: currentUser) // filters results by current user's UID
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
                
                //Counts results when fetching the results data
                self.countRes()
            }
    }
    
    func countRes() {
        
        //Clears results to ensure that the previous counts are cleared before counting the existing results i.e. does a recount
        
        data = [0, 0, 0, 0, 0, 0]
        for result in results {
            if result.Result == "Social" {
                //social
                data[0] += 1
            }
            
            if result.Result == "Artistic" {
                //artistic
                data[1] += 1
            }
            
            if result.Result == "Realistic"{
                //realistic
                data[2] += 1
            }
            
            if result.Result == "Conventional" {
                //conventional
                data[3] += 1
            }
            
            if result.Result == "Enterprising" {
                //enterprising
                data[4] += 1
            }
            
            if result.Result == "Investigative" {
                //investigative
                data[5] += 1
            }
        }
    }
    
}
