//
//  DirectionTableViewCell.swift
//  TravellingApp
//
//  Created by Aizada on 15.04.2024.
//

import UIKit

final class DirectionTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let flightOnLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Flight on:"
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "November 10, 2024"
        return label
    }()
    
    private let timeFromLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "14:00"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        return label
    }()
    
    private let fromLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "California"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        return label
    }()
    
    private let timeToLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19:00"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        return label
    }()
    
    private let toLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Toronto"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        return label
    }()
    
    private let distanceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.customBlue
        return view
    }()
    
    private let planeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "airplane")
        imageView.tintColor = Colors.customBlue
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupSubviews() {
        addSubview(flightOnLabel)
        addSubview(dateLabel)
        addSubview(timeFromLabel)
        addSubview(fromLocationLabel)
        addSubview(timeToLabel)
        addSubview(toLocationLabel)
        addSubview(distanceView)
        distanceView.addSubview(planeImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            flightOnLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            flightOnLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: flightOnLabel.trailingAnchor, constant: 5),
            
            timeFromLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            timeFromLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            fromLocationLabel.topAnchor.constraint(equalTo: timeFromLabel.bottomAnchor, constant: 5),
            fromLocationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            timeToLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            timeToLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            toLocationLabel.topAnchor.constraint(equalTo: timeToLabel.bottomAnchor, constant: 5),
            toLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            distanceView.topAnchor.constraint(equalTo: fromLocationLabel.bottomAnchor, constant: 5),
            distanceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            distanceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            distanceView.heightAnchor.constraint(equalToConstant: 2),
            
            planeImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            planeImageView.widthAnchor.constraint(equalToConstant: 20),
            planeImageView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
