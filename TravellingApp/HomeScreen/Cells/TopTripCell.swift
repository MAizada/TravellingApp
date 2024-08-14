//
//  TopTripCell.swift
//  TravellingApp
//
//  Created by Aizada on 04.04.2024.
//

import UIKit

final class TopTripCell: UICollectionViewCell {
    
    var trip: Trip?
    
    private let imageView: UIImageView = {
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
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "heart"), for: .normal)
        return button
    }()
    
    private let starIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 10
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(rating)
        addSubview(locationLabel)
        addSubview(locationIcon)
        addSubview(priceLabel)
        addSubview(favoriteButton)
        addSubview(starIcon)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            starIcon.centerYAnchor.constraint(equalTo: rating.centerYAnchor),
            starIcon.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            starIcon.widthAnchor.constraint(equalToConstant: 15),
            starIcon.heightAnchor.constraint(equalToConstant: 15),
            
            rating.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            rating.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 5),
            rating.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            locationIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            locationIcon.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 12),
            locationIcon.heightAnchor.constraint(equalToConstant: 12),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            
            priceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            favoriteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configure(with trip: Trip) {
        titleLabel.text = trip.title
        rating.text = "\(trip.rating)"
        locationLabel.text = trip.location
        priceLabel.text = "$\(trip.price) /visit"
        favoriteButton.setImage(trip.isFavorite ? UIImage(named: "heart_filled") : UIImage(named: "heart"), for: .normal)
        
    }
}
