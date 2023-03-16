////
////  CategoryViewModel.swift
////  Career's Guidance App
////
////  Created by Emma Roche on 12/03/2023.
////
//
//import SwiftUI
//import Firebase
//import FirebaseFirestore
//
//class CategoryViewModel: ObservableObject {
//    @Published var categories: [Categories] = []
//    
//    func getCategories(set: String) {
//        // since we are having only one set in Firestore, so we are going to fetch that one only
//        // you can add round 2, 3, etc.. into Firestore and can be fetched
//        let db = Firestore.firestore()
//        
//        // change this to set
//        db.collection("categories").getDocuments { (snapshot, err) in
//            
//            guard let data = snapshot else { return }
//            
//            DispatchQueue.main.async {
//                self.categories = data.documents.compactMap({ (doc) -> Categories? in
//                    return try? doc.data(as: Categories.self)
//                })
//                print(self.categories)
//            }
//            
//        }
//    }
//}
