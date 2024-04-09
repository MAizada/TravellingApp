//
//  LocationView.swift
//  TravellingApp
//
//  Created by Aizada on 04.04.2024.
//

import UIKit

final class ExploreView: UIViewController {

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
        return button
    }()
    
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
    
    @objc private func startButtonTapped() {
        let newVC = DetailExploreView()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(exploreLabel)
        view.addSubview(notificationButton)
        view.addSubview(exploreImageView)
        view.addSubview(locationLabel)
        view.addSubview(distanceLabel)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            exploreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            exploreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            notificationButton.centerYAnchor.constraint(equalTo: exploreLabel.centerYAnchor),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            exploreImageView.topAnchor.constraint(equalTo: exploreLabel.bottomAnchor, constant: 20),
            exploreImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            exploreImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            exploreImageView.heightAnchor.constraint(equalToConstant: 350),
            
            locationLabel.topAnchor.constraint(equalTo: exploreLabel.bottomAnchor, constant: 40),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            distanceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            distanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startButton.widthAnchor.constraint(equalToConstant: 80),
            startButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
