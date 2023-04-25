//
//  LineView.swift
//  CGA
//
//  Created by Emma Roche on 21/01/2023.
//

import UIKit

class LineView: UIView {
    
    // MARK: - UI Components
    
    private let lineWithText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    
    // MARK: - LifeCycle
    
    init(lineWithOr: String) {
        super.init(frame: .zero)
        self.lineWithText.text = lineWithOr
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.addSubview(lineWithText)
        
        lineWithText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.lineWithText.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.lineWithText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.lineWithText.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
    }
}
