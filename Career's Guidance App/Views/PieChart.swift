//
//  PieChart.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 12/04/2023.
//

import SwiftUI

//Code Resource: https://towardsdatascience.com/data-visualization-with-swiftui-pie-charts-bcad1903c5d2

struct PieChart: View {
  @Binding var data: [Double]
  @State var labels: [String]!
  
  private let colors: [Color]
  private let borderColor: Color
  private let sliceOffset: Double = -.pi / 2
    
  init(data: Binding<[Double]>, labels: [String], colors: [Color], borderColor: Color) {
    self._data = data
    self.labels = labels
    self.colors = colors
    self.borderColor = borderColor
  }
  
  var body: some View {
    GeometryReader { geo in
      ZStack(alignment: .center) {
          ForEach(0 ..< data.count, id: \.self) { index in
              
              // Only display result category data in analysis that is greater than 0
              if data[index] > 0 {
                  PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
                      .fill(colors[index % colors.count])
                  
                  PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
                      .stroke(borderColor, lineWidth: 1.3)
                  
                  PieSliceText(
                    title: "\(labels[index])",
                    // Calculates total value of data and converts to %
                    description: "\(Int(data[index] / data.reduce(0.0, +) * 101))%"
                  )
                  .offset(textOffset(for: index, in: geo.size))
                  .zIndex(1)
              }
          }
      }
    }
  }
  
  private func startAngle(for index: Int) -> Double {
    switch index {
      case 0:
        return sliceOffset
      default:
        let ratio: Double = data[..<index].reduce(0.0, +) / data.reduce(0.0, +)
        return sliceOffset + 2 * .pi * ratio
    }
  }
  
  private func endAngle(for index: Int) -> Double {
    switch index {
      case data.count - 1:
        return sliceOffset + 2 * .pi
      default:
        let ratio: Double = data[..<(index + 1)].reduce(0.0, +) / data.reduce(0.0, +)
        return sliceOffset + 2 * .pi * ratio
    }
  }
  
  private func textOffset(for index: Int, in size: CGSize) -> CGSize {
      let radius = min(size.width, size.height) / 3.8
    let dataRatio = (2 * data[..<index].reduce(0, +) + data[index]) / (2 * data.reduce(0, +))
    let angle = CGFloat(sliceOffset + 2 * .pi * dataRatio)
    return CGSize(width: radius * cos(angle), height: radius * sin(angle))
  }
}
