//
//  PieSlice.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 12/04/2023.
//

//Code Resource: https://towardsdatascience.com/data-visualization-with-swiftui-pie-charts-bcad1903c5d2

import SwiftUI

struct PieSlice: Shape {
  let startAngle: Double
  let endAngle: Double
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let radius = min(rect.width, rect.height) / 2
    let alpha = CGFloat(startAngle)
    
    let center = CGPoint(
      x: rect.midX,
      y: rect.midY
    )
    
    path.move(to: center)
    
    path.addLine(
      to: CGPoint(
        x: center.x + cos(alpha) * radius,
        y: center.y + sin(alpha) * radius
      )
    )
    
    path.addArc(
      center: center,
      radius: radius,
      startAngle: Angle(radians: startAngle),
      endAngle: Angle(radians: endAngle),
      clockwise: false
    )
    
    path.closeSubpath()
    
    return path
  }
}
