////
////  ViewController2.swift
////  Career's Guidance App
////
////  Created by Emma Roche on 22/02/2023.
////
//
//import UIKit
//
//class ViewController2: UIViewController {
//
//    private let buttonImage: [UIImage] = [
//        UIImage(named: "arrow")!,
//        UIImage(named: "arrow")!
//    ]
//
//
//
//    // MARK: - UI Components
//
//    private let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .white
//        tableView.register(TableViewCell2.self, forCellReuseIdentifier: TableViewCell2.identifier)
//        return tableView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setupUI()
//
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//
//
//    }
//
//    private func setupUI() {
//        self.view.backgroundColor = .white
//
//        self.view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            self.tableView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
//            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//
//        ])
//    }
//
//}
//
//extension ViewController2: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.buttonImage.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.identifier , for: indexPath) as? TableViewCell2 else{
//            fatalError("Error creating cell")
//        }
//
//        let image = self.buttonImage[indexPath.row]
//        cell.configure(with: image, and: indexPath.row.description)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 160
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        print("DEBUG Print:", indexPath.row)
//
//    }
//
//
//}
