////
////  DetailExploreView.swift
////  TravellingApp
////
////  Created by Aizada on 09.04.2024.
////
//
//import UIKit
//
//final class DetailExploreView: UIViewController {
//
//    // MARK: - UI Elements
//
//    private let backgroundImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "Canada")
//        return imageView
//    }()
//
//    private let whiteView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 20
//        return view
//    }()
//
//    private let exploreImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "Image")
//        imageView.layer.cornerRadius = 10
//        return imageView
//    }()
//
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "King + Duke"
//        label.font = UIFont.boldSystemFont(ofSize: 24)
//        return label
//    }()
//
//    private let ratingIcon: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(systemName: "star.fill")
//        imageView.tintColor = Colors.customYellow
//        return imageView
//    }()
//
//    private let ratingLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "4.5"
//        label.font = UIFont.systemFont(ofSize: 18)
//        return label
//    }()
//
//    private let text: UITextView = {
//        let textView = UITextView()
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.text = """
//        One of EATER National and Atlanta Magazine’s most
//        anticipated new openings of 2013.This new restaurant by
//         Ford Fry and Rocket Farm, designed by Meyer Davis and NO
//        Architecture, is located at the corner of West Paces Ferry,
//        """
//        textView.font = UIFont.systemFont(ofSize: 10)
//        textView.isEditable = false
//        textView.isScrollEnabled = false
//        return textView
//    }()
//
//    private let avatarImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = UIImage(systemName: "person")
//        imageView.layer.cornerRadius = 20
//        return imageView
//    }()
//
//    private let reviewerLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Reviewer Name"
//        label.font = UIFont.systemFont(ofSize: 12)
//        label.textColor = Colors.customBlue
//        label.textColor = .gray
//        return label
//    }()
//
//    private let additionalLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "2 weeks ago"
//        label.font = UIFont.boldSystemFont(ofSize: 12)
//        return label
//    }()
//
//    // MARK: - Lifecycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//        
//        setupUI()
//    }
//
//    // MARK: - UI Setup
//
//    private func setupUI() {
//        view.addSubview(backgroundImage)
//        view.addSubview(whiteView)
//        whiteView.addSubview(exploreImageView)
//        whiteView.addSubview(nameLabel)
//        whiteView.addSubview(ratingIcon)
//        whiteView.addSubview(ratingLabel)
//        whiteView.addSubview(text)
//        whiteView.addSubview(avatarImageView)
//        whiteView.addSubview(reviewerLabel)
//        whiteView.addSubview(additionalLabel)
//
//        NSLayoutConstraint.activate([
//            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
//            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            whiteView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
//            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            whiteView.heightAnchor.constraint(equalToConstant: 380),
//
//            exploreImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 5),
//            exploreImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 5),
//            exploreImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -5),
//            exploreImageView.heightAnchor.constraint(equalToConstant: 180),
//
//            nameLabel.topAnchor.constraint(equalTo: exploreImageView.bottomAnchor, constant: 10),
//            nameLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
//
//            ratingLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
//            ratingLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10),
//
//            ratingIcon.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
//            ratingIcon.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -5),
//            ratingIcon.widthAnchor.constraint(equalToConstant: 20),
//            ratingIcon.heightAnchor.constraint(equalToConstant: 20),
//
//            text.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
//            text.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
//            text.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10),
//
//            avatarImageView.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10),
//            avatarImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
//            avatarImageView.widthAnchor.constraint(equalToConstant: 25),
//            avatarImageView.heightAnchor.constraint(equalToConstant: 25),
//
//            reviewerLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
//            reviewerLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
//
//            additionalLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
//            additionalLabel.leadingAnchor.constraint(equalTo: reviewerLabel.trailingAnchor, constant: 10),
//
//        ])
//    }
//
//    @objc func backAction() {
//        self.navigationController?.popViewController(animated: true)
//    }
//}
