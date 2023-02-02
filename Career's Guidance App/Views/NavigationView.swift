//
//  NavigationView.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 29/01/2023.
//

import UIKit

class NavigationView: UIView {

    override func draw(_ rect: CGRect) {
        let size = self.bounds.size
        let h = size.height * 1.85

        // calculate the 5 points of the pentagon
        let p1 = self.bounds.origin
        let p2 = CGPoint(x:p1.x + size.width, y:p1.y)
        let p3 = CGPoint(x:p2.x, y:p2.y + h)
        let p4 = CGPoint(x:size.width/2, y:size.height)
        let p5 = CGPoint(x:p1.x, y:h)

        // create the path
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addLine(to: p5)
        path.close()

        // fill the path
        UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00).set()
        path.fill()
    }

}
