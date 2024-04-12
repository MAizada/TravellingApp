//
//  PackagesTableViewCell.swift
//  TravellingApp
//
//  Created by Aizada on 09.04.2024.
//

import UIKit

struct Package {
    let image: UIImage?
    let name: String
    let price: Double
}

final class PackagesTableViewCell: UITableViewCell {
    
    private let packageImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let packageNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let packagePriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.customBlue
        return label
    }()
    
    private let bookPackageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Book Now", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = Colors.customBlue
        button.addTarget(self, action: #selector(bookPackageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func bookPackageButtonTapped() {
      print("tapped")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(packageImage)
        addSubview(packageNameLabel)
        addSubview(packagePriceLabel)
        addSubview(bookPackageButton)
        
        NSLayoutConstraint.activate([
            packageImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            packageImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            packageImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            packageImage.widthAnchor.constraint(equalToConstant: 140),
            
            packageNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            packageNameLabel.leadingAnchor.constraint(equalTo: packageImage.trailingAnchor, constant: 10),
            packageNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            packagePriceLabel.topAnchor.constraint(equalTo: packageNameLabel.bottomAnchor, constant: 10),
            packagePriceLabel.leadingAnchor.constraint(equalTo: packageImage.trailingAnchor, constant: 10),
            packagePriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            bookPackageButton.topAnchor.constraint(equalTo: packagePriceLabel.bottomAnchor, constant: 10),
            bookPackageButton.leadingAnchor.constraint(equalTo: packageImage.trailingAnchor, constant: 10),
            bookPackageButton.widthAnchor.constraint(equalToConstant: 80),
            bookPackageButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with package: Package) {
        if let packageImage = package.image {
            self.packageImage.image = packageImage
        }
        packageNameLabel.text = package.name
        packagePriceLabel.text = "$\(package.price)/visit"
    }
}
