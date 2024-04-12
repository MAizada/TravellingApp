//
//  EventsTableViewCell.swift
//  TravellingApp
//
//  Created by Aizada on 09.04.2024.
//

import UIKit

final class EventsTableViewCell: UITableViewCell {
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let rating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .left
        return label
    }()
    
    private let locationIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "location"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = Colors.customBlue
        return label
    }()
    
    private let bookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Book Now", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = Colors.customBlue
        button.addTarget(self, action: #selector(bookButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func bookButtonTapped() {
      print("tapped")
    }
    
    private let starIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 10
        
        addSubview(image)
        addSubview(titleLabel)
        addSubview(rating)
        addSubview(locationLabel)
        addSubview(locationIcon)
        addSubview(priceLabel)
        addSubview(bookButton)
        addSubview(starIcon)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            image.widthAnchor.constraint(equalToConstant: 140),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        
            starIcon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            starIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            starIcon.widthAnchor.constraint(equalToConstant: 15),
            starIcon.heightAnchor.constraint(equalToConstant: 15),
            
            rating.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            rating.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            locationIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            locationIcon.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 12),
            locationIcon.heightAnchor.constraint(equalToConstant: 12),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            
            priceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            bookButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            bookButton.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            bookButton.widthAnchor.constraint(equalToConstant: 80),
            bookButton.heightAnchor.constraint(equalToConstant: 20)
            ])

       
    }
    
    func configure(with trip: Trip) {
        if let tripImage = trip.image {
            image.image = tripImage
        }
        titleLabel.text = trip.title
        rating.text = "\(trip.rating)"
        locationLabel.text = trip.location
        priceLabel.text = "$\(trip.price) /visit"
        
        if let favoriteImg = trip.favoriteImage {
            bookButton.setImage(favoriteImg, for: .normal)
        }
    }
}
