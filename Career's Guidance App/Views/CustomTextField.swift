//
//  CustomTextField.swift
//  CGA
//
//  Created by Emma Roche on 18/01/2023.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case firstName
        case email
        case password
        case confirmPassword
    }
    
    private let authFieldType: CustomTextFieldType
    
    //padding code source: https://stackoverflow.com/questions/25367502/create-space-at-the-beginning-of-a-uitextfield
    
    let padding = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        
        self.layer.cornerRadius = 12
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))

        switch fieldType {
        case .firstName:
            self.placeholder = "First Name"
            let imageView = UIImageView(frame: CGRect(x: -2, y: 0, width: 55, height: 55))
            let image = UIImage(named: "fieldImage3")
            imageView.image = image
            imageView.contentMode = .scaleAspectFit

            let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
            view.addSubview(imageView)
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = view
        
            
        case .email:
            self.placeholder = "Email Address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            let imageView = UIImageView(frame: CGRect(x: -2, y: 0, width: 55, height: 55))
            let image = UIImage(named: "fieldImage")
            imageView.image = image
            imageView.contentMode = .scaleAspectFit

            let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
            view.addSubview(imageView)
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = view
            
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            let imageView = UIImageView(frame: CGRect(x: -2, y: 0, width: 55, height: 55))
            let image = UIImage(named: "fieldImage2")
            imageView.image = image
            imageView.contentMode = .scaleAspectFit

            let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
            view.addSubview(imageView)
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = view
            
        case .confirmPassword:
            self.placeholder = "Confirm Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            let imageView = UIImageView(frame: CGRect(x: -2, y: 0, width: 55, height: 55))
            let image = UIImage(named: "fieldImage2")
            imageView.image = image
            imageView.contentMode = .scaleAspectFit

            let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
            view.addSubview(imageView)
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = view
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
