//
//  HomeView.swift
//  TravellingApp
//
//  Created by Aizada on 03.04.2024.
//

import UIKit

final class HomeView: UIViewController {
    
    // MARK: - UI Elements
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "location")
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        let titleString = NSMutableAttributedString(string: " Current Location", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        
        let arrowAttachment = NSTextAttachment()
        arrowAttachment.image = UIImage(systemName: "chevron.down")
        let arrowString = NSAttributedString(attachment: arrowAttachment)
        
        titleString.append(arrowString)
        
        let completeString = NSMutableAttributedString()
        completeString.append(imageString)
        completeString.append(titleString)
        
        button.setAttributedTitle(completeString, for: .normal)
        
        return button
    }()

    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "bell.fill")
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        button.setAttributedTitle(imageString, for: .normal)
        
        return button
    }()

    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "list") , for: .normal)
       return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(locationLabel)
        view.addSubview(locationButton)
        view.addSubview(notificationButton)
        view.addSubview(searchBar)
        view.addSubview(listButton)
        
        setupConstraints()
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        listButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            locationButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationButton.widthAnchor.constraint(equalToConstant: 200),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            
            notificationButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            notificationButton.widthAnchor.constraint(equalToConstant: 40),
            notificationButton.heightAnchor.constraint(equalToConstant: 40),
            
            searchBar.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            listButton.topAnchor.constraint(equalTo: notificationButton.bottomAnchor, constant: 20),
            listButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            listButton.widthAnchor.constraint(equalToConstant: 40),
            listButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        listButton.backgroundColor = Colors.customBlue
        listButton.layer.cornerRadius = 20
        listButton.clipsToBounds = true
    }
}
