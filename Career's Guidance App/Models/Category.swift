//
//  Category.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/03/2023.
//

struct Category: Comparable {
    var categoryName: String
    var categoryDescription: String
    var categoryCount: Int
    
    static func < (lhs: Category, rhs: Category) -> Bool {
        return lhs.categoryCount < rhs.categoryCount
    }
}

