//
//  BasicText.swift
//  CGA
//
//  Created by Emma Roche on 22/01/2023.
//

import UIKit

class BasicText: UIView {
    
    private let bText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    // MARK: - LifeCycle
    
    init(text: String) {
        super.init(frame: .zero)
        self.bText.text = text
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        
        self.addSubview(bText)
        
        bText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.bText.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.bText.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bText.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
}
