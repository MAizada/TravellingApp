//
//  DirectionsAndTransport.swift
//  TravellingApp
//
//  Created by Aizada on 15.04.2024.
//

import UIKit

final class DirectionsAndTransportView: UIViewController {
    
    // MARK: - UI Elements
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Canada")
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    private let arrivingDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Arriving Date to US, California"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$40"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "November 10, 2024 - Wednesday"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DirectionTableViewCell.self, forCellReuseIdentifier: "DirectionTableViewCell")
        return tableView
    }()
    
    private let bookNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Book Now", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Colors.customBlue
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - UI Setup
    
    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(mainImageView)
        view.addSubview(arrivingDateLabel)
        view.addSubview(priceLabel)
        view.addSubview(dateLabel)
        view.addSubview(timeLabel)
        view.addSubview(tableView)
        view.addSubview(bookNowButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            mainImageView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainImageView.heightAnchor.constraint(equalToConstant: 300),
            
            arrivingDateLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10),
            arrivingDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(equalTo: arrivingDateLabel.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            dateLabel.topAnchor.constraint(equalTo: arrivingDateLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 200),
            
            bookNowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            bookNowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bookNowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            bookNowButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

extension DirectionsAndTransportView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirectionTableViewCell", for: indexPath) as! DirectionTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90 
    }
}
