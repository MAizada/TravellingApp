//
//  GroupTripCell.swift
//  TravellingApp
//
//  Created by Aizada on 04.04.2024.
//

import UIKit

final class GroupTripCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(secondTitleLabel)
        addSubview(locationIcon)
        addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 110),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            secondTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            secondTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            secondTitleLabel.widthAnchor.constraint(equalToConstant: 15),
            secondTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            
            locationIcon.centerYAnchor.constraint(equalTo: secondTitleLabel.centerYAnchor),
            locationIcon.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 15),
            locationIcon.heightAnchor.constraint(equalToConstant: 15),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])

    }
    
    func configure(with groupTrip: GroupTrip) {
        imageView.image = groupTrip.image
        titleLabel.text = groupTrip.title
        locationLabel.text = groupTrip.location
    }
}
