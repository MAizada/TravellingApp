//
//  FirstExploreCollectionViewCell.swift
//  TravellingApp
//
//  Created by Aizada on 15.04.2024.
//

import UIKit

final class FirstExploreCollectionViewCell: UICollectionViewCell {
    
    var navigationController: UINavigationController?

    // MARK: - UI Elements
    
    private let exploreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Explore"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(notificationButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func notificationButtonPressed() {
        let notificationView = NotificationView()
        navigationController?.pushViewController(notificationView, animated: true)
    }
    
    private let exploreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Canada")
        return imageView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Toronto, Canada"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12.5 km"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.setImage(UIImage(named: "startButton"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.tintColor = .white
        button.backgroundColor = Colors.customBlue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupSubviews() {
        addSubview(exploreLabel)
        addSubview(notificationButton)
        addSubview(exploreImageView)
        addSubview(locationLabel)
        addSubview(distanceLabel)
        addSubview(startButton)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            exploreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            exploreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            notificationButton.centerYAnchor.constraint(equalTo: exploreLabel.centerYAnchor),
            notificationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            exploreImageView.topAnchor.constraint(equalTo: exploreLabel.bottomAnchor, constant: 20),
            exploreImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            exploreImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            exploreImageView.heightAnchor.constraint(equalToConstant: 350),
            
            locationLabel.topAnchor.constraint(equalTo: exploreLabel.bottomAnchor, constant: 40),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            distanceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            distanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startButton.widthAnchor.constraint(equalToConstant: 80),
            startButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // MARK: - Actions
    
    @objc private func startButtonTapped() {
        let directionsAndTransportView = DirectionsAndTransportView()
        navigationController?.pushViewController(directionsAndTransportView, animated: true)
    }
}

