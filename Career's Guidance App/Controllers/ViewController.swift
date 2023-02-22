//
//  ViewController.swift
//  Career's Guidance App
//
//  Created by Emma Roche on 16/02/2023.
//

import UIKit

class CardContent {

    var title: String?
    var content: String?
    var buttonImage: UIImage?
    
    init(title: String, content: String, buttonImage: UIImage) {
        self.buttonImage = buttonImage
        self.title = title
        self.content = content
    }
}

class ViewController: UIViewController {
    
    var tableView = UITableView()
    
    var content = [CardContent]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        content.append(CardContent(title: "Questionnaire", content: "Retake questionnaire", buttonImage: #imageLiteral(resourceName: "arrow")))
        content.append(CardContent(title: "Results Dashboard", content: "View questionnaire results",buttonImage: #imageLiteral(resourceName: "arrow")))
    }

    func setTableView() {
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = .white
        self.view.addSubview(tableView)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {fatalError("Unable to create cell")}
        cell.contentTitle.text = content[indexPath.row].title
        cell.contentText.text = content[indexPath.row].content
        cell.buttonImage.image = content[indexPath.row].buttonImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}

