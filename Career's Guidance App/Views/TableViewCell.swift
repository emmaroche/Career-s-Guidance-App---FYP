//
//  TableViewCell.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 21/02/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
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
        return lbl
    }()
    
    lazy var contentText: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 10, y: 65, width: backView.frame.width - 10, height: 30))
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var buttonImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 310, y: 69, width: 30, height: 30))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 12
        contentTitle.layer.cornerRadius = 12
        // Applys cornerRadius for the top-left and top-right corner only
        contentTitle.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backView.clipsToBounds = false
        self.backView.layer.masksToBounds = false

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(contentTitle)
        backView.addSubview(contentText)
        backView.addSubview(buttonImage)
    }
    
}

extension UIView {
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSizeMake(1.0, 1.0)
    }
}
