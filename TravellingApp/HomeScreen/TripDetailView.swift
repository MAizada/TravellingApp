//
//  TripDetailView.swift
//  TravellingApp
//
//  Created by Aizada on 08.04.2024.
//

import UIKit

struct TripDetailCatrgories {
    let title: String
    let secondTitle: String
    let image: UIImage?
    let rating: Double
    let location: String
    let information: String
}

final class TripDetailView: UIViewController {
    
    var trip: Trip?
    var tripDetailCategories: [TripDetailCatrgories] = []
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let tripImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = Colors.customYellow
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let locationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "location")
        return imageView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let informationTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        return textView
    }()
    
    private let bookingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Booking Now", for: .normal)
        button.backgroundColor = Colors.customBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = Colors.customBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupData()
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    private func setupUI() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(tripImageView)
        view.addSubview(secondTitleLabel)
        view.addSubview(ratingImageView)
        view.addSubview(ratingLabel)
        view.addSubview(locationIconImageView)
        view.addSubview(locationLabel)
        view.addSubview(informationTextView)
        view.addSubview(bookingButton)
        view.addSubview(favoritesButton)
        
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tripImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tripImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tripImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tripImageView.heightAnchor.constraint(equalToConstant: 370),
            
            secondTitleLabel.topAnchor.constraint(equalTo: tripImageView.bottomAnchor, constant: 10),
            secondTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            ratingImageView.centerYAnchor.constraint(equalTo: secondTitleLabel.centerYAnchor),
            ratingImageView.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -10),
            ratingImageView.widthAnchor.constraint(equalToConstant: 20),
            ratingImageView.heightAnchor.constraint(equalToConstant: 20),
            
            ratingLabel.centerYAnchor.constraint(equalTo: secondTitleLabel.centerYAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            locationIconImageView.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 10),
            locationIconImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationIconImageView.widthAnchor.constraint(equalToConstant: 20),
            locationIconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationIconImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIconImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            informationTextView.topAnchor.constraint(equalTo: locationIconImageView.bottomAnchor, constant: 10),
            informationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            informationTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            informationTextView.heightAnchor.constraint(equalToConstant: 180),
            
            bookingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            bookingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bookingButton.trailingAnchor.constraint(equalTo: favoritesButton.trailingAnchor, constant: -30),
            bookingButton.heightAnchor.constraint(equalToConstant: 50),
            
            favoritesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            favoritesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            favoritesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupData() {
        guard let trip = trip else { return }
        
        titleLabel.text = trip.title
        secondTitleLabel.text = trip.location
        tripImageView.image = UIImage(named: "placeholder_image") 
        ratingLabel.text = String(trip.rating)
        
        if let tripDetail = tripDetailCategories.first(where: { $0.secondTitle == trip.title }) {
            locationLabel.text = tripDetail.location
            informationTextView.text = tripDetail.information
   
        }
    }
}
