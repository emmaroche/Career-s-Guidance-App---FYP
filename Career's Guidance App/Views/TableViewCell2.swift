//
//  TableViewCell2.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 22/02/2023.
//

import UIKit

class TableViewCell2: UITableViewCell {


    static let identifier = "TableViewCell2"
    
    private let buttonImageView: UIImageView = {
        
       let biv = UIImageView()
        biv.contentMode = .scaleAspectFit
        biv.image = UIImage(systemName: "arrow")
        biv.tintColor = .label
        return biv
    }()
    
    lazy var backView: UIView = {
       let view = UIView(frame: CGRect(x: 10, y: 20, width: self.frame.width + 50, height: 120))
        view.backgroundColor = UIColor.white
        view.addShadow()
        return view
    }()
    
    lazy var contentTitle: UILabel = {
       let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: backView.frame.width, height: 50))
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor(red: 0.20, green: 0.48, blue: 0.67, alpha: 1.00)
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.clipsToBounds = true
        lbl.text = "Hello"
        return lbl
    }()
    
    lazy var contentText: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 10, y: 65, width: backView.frame.width - 10, height: 30))
        lbl.textAlignment = .center
        return lbl
    }()
    
//    private let label1: UILabel = {
//        let lbl = UILabel()
//         lbl.textAlignment = .center
//         lbl.textColor = .black
//         lbl.font = .systemFont(ofSize: 18, weight: .bold)
//        lbl.text = "Error"
//         return lbl
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: UIImage, and label: String){
        self.buttonImageView.image = image
        self.contentTitle.text = label
    }
    
    private func setupUI() {
        
        self.contentView.addSubview(buttonImageView)
        
        self.contentView.addSubview(contentTitle)
        
        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        contentTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            contentTitle.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            contentTitle.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            contentTitle.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            contentTitle.heightAnchor.constraint(equalToConstant: 90),
            contentTitle.widthAnchor.constraint(equalToConstant: 90),
            
            buttonImageView.leadingAnchor.constraint(equalTo: self.contentTitle.trailingAnchor, constant: 25),
            buttonImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25),
            buttonImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            buttonImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            buttonImageView.heightAnchor.constraint(equalToConstant: 20),
            buttonImageView.widthAnchor.constraint(equalToConstant: 20),
            
            
            
        ])
    }
        
}
    
