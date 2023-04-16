//
//  CustomButton.swift
//  CGA
//
//  Created by Emma Roche on 18/01/2023.
//

import UIKit

class CustomButton: UIButton {
    
    enum FontSize {
        case big
        case med
        case small
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        //drop shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 3
        self.layer.masksToBounds = false
        
        
        self.backgroundColor = hasBackground ? UIColor(red: 0.53, green: 0.72, blue: 0.52, alpha: 1.00): .clear
        
        let titleColor: UIColor = hasBackground ? UIColor(red: 0.16, green: 0.20, blue: 0.33, alpha: 1.00) : .white
        
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
            
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
