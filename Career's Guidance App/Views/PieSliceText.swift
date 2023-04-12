//
//  PieSliceText.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 12/04/2023.
//

import SwiftUI


struct PieSliceText: View {
  let title: String
  let description: String
  
  var body: some View {
    VStack {
      Text(title)
        .font(.headline)
      Text(description)
        .font(.body)
    }
  }
}
