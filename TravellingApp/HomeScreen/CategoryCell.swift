//
//  CategoryCell.swift
//  TravellingApp
//
//  Created by Aizada on 04.04.2024.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    var category: String? {
        didSet {
            titleLabel.text = category
            imageView.image = UIImage(named: category?.lowercased() ?? "")
        }
    }
    
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
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        
        addSubview(imageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            imageView.widthAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
    }
}
