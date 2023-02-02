//
//  AccountView.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 29/01/2023.
//

import UIKit

class AccountView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
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
    
    private let accountTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    // MARK: - LifeCycle
    init(title: String) {
        super.init(frame: .zero)
        self.accountTextLabel.text = title
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {

        self.addSubview(accountTextLabel)
        self.addSubview(logoImageView)

        
        accountTextLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            self.accountTextLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            self.accountTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.accountTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
            self.logoImageView.topAnchor.constraint(equalTo: accountTextLabel.bottomAnchor),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 200),
            self.logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),

        ])
    }
    
}
