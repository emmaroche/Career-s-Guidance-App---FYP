//
//  ViewController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/02/2023.
//

import FirebaseFirestore
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let database = Firestore.firestore()

    private let label: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let field: UITextField = {
        
        let field = UITextField()
        field.placeholder = "LOL"
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(field)
        field.delegate = self

        
        let dofRef = database.document("cga/textinput")
        
        dofRef.addSnapshotListener { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }

            guard let text = data["text"] as? String else{
                return
            }

            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        
        view.backgroundColor = .white
    }

    override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
        field.frame = CGRect(x: 10, y: view.safeAreaInsets.top+10, width: view.frame.size.width-20, height: 50)
        label.frame = CGRect(x: 10, y: view.safeAreaInsets.top+10+60, width: view.frame.size.width-20, height: 100)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            saveData(text: text)
        }
       return true
    }

    func saveData(text: String){
        let dofRef = database.document("cga/ex")
        dofRef.setData(["text": text])
        
    }
    
}
