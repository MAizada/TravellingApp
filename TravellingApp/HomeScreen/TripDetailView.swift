//
//  TripDetailView.swift
//  TravellingApp
//
//  Created by Aizada on 08.04.2024.
//

import UIKit

final class TripDetailView: UIViewController {
    
    var trip: Trip?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Lake View"
        return label
    }()
    
    private let tripImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "RedFish")
        return imageView
    }()
    
    private let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "RedFish Lake"
        return label
    }()
    
    private let ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "star.fill") // Added star image for rating
        imageView.tintColor = UIColor(red: 255/255, green: 223/255, blue: 0/255, alpha: 1) // Yellow color for star
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "4.5" // Default rating value
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
        label.text = "Idaho"
        return label
    }()
    
    private let informationTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.text = """
        What is Redfish Lake known for?
        
        Redfish Lake is the final stop on the longest
        Pacific salmon run in North America, which
        requires long-distance swimmers, such as
        Sockeye and Chinook Salmon, to travel over
        900 miles upstream to return to their spawning
        grounds.
        
        Redfish Lake is an alpine lake in Custer County,
        Idaho, just south of Stanley. It is the largest lake
        within the Sawtooth National Recreation Area.
        """
        return textView
    }()

    
    private let bookingButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Booking Now", for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 143/255, blue: 160/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0, green: 143/255, blue: 160/255, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(tripImageView)
        contentView.addSubview(secondTitleLabel)
        contentView.addSubview(ratingImageView)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(locationIconImageView)
        contentView.addSubview(locationLabel)
        contentView.addSubview(informationTextView)
        contentView.addSubview(bookingButton)
        contentView.addSubview(favoritesButton)
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            tripImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tripImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            tripImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            tripImageView.heightAnchor.constraint(equalToConstant: 370),
            
            secondTitleLabel.topAnchor.constraint(equalTo: tripImageView.bottomAnchor, constant: 10),
            secondTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            ratingImageView.centerYAnchor.constraint(equalTo: secondTitleLabel.centerYAnchor),
            ratingImageView.leadingAnchor.constraint(equalTo: secondTitleLabel.trailingAnchor, constant: 10),
            ratingImageView.widthAnchor.constraint(equalToConstant: 20),
            ratingImageView.heightAnchor.constraint(equalToConstant: 20),
            
            ratingLabel.centerYAnchor.constraint(equalTo: secondTitleLabel.centerYAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: ratingImageView.trailingAnchor, constant: 5),
            
            locationIconImageView.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 10),
            locationIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationIconImageView.widthAnchor.constraint(equalToConstant: 20),
            locationIconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationIconImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationIconImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            informationTextView.topAnchor.constraint(equalTo: locationIconImageView.bottomAnchor, constant: 20),
            informationTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            informationTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            informationTextView.bottomAnchor.constraint(equalTo: bookingButton.topAnchor, constant: -20),
            
            bookingButton.leadingAnchor.constraint(equalTo: informationTextView.leadingAnchor, constant: 20),
            bookingButton.trailingAnchor.constraint(equalTo: informationTextView.trailingAnchor, constant: -20),
            bookingButton.bottomAnchor.constraint(equalTo: favoritesButton.topAnchor, constant: -10),
            bookingButton.heightAnchor.constraint(equalToConstant: 50),
            
            favoritesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            favoritesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            favoritesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            favoritesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
